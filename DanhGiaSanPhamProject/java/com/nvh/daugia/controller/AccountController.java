package com.nvh.daugia.controller;

import javax.naming.AuthenticationException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nvh.daugia.model.jpa.User;
import com.nvh.daugia.service.UserService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

@Controller
public class AccountController {
	public static final String ACCOUNT_ATTRIBUTE = "account";
	final Logger logger = LoggerFactory.getLogger(AccountController.class);
	// controller dang nhap va dang xuat
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login")
	public String getlogin(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		String username = (String) session.getAttribute("username");
		if (role != null) {
			// User user =
			// userService.findById(SecurityContextHolder.getContext().getAuthentication().getName());
			session.setAttribute("account", username);
			String weblink = "redirect:/";
			switch (role) {
			case "user":
				weblink += "sinhvien";
				break;
			case "admin":
				weblink += "admin";
				break;
			}
			return weblink;
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpSession session) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource webResource = client.resource(Server.addressAuthenWS);
		Form form = null;
		// get authencode form AuthenService
		webResource = client.resource(Server.addressAuthenWS);
		String authencode = "";
		form = new Form();
		form.add("username", username);
		form.add("password", password);
		authencode = webResource.path("login/loginpost").post(String.class, form);
		if (authencode.equals("")) {
			model.addAttribute("error", "Tài khoản hoặc mật khẩu không đúng !!");
			return "login";
		} else {
			// access to AuctionService
			webResource = client.resource(Server.addressAuctionWS);
			form = new Form();
			form.add("username", username);
			form.add("authencode", authencode);
			String result = webResource
					.path("user/access")
					.cookie(new NewCookie("JSESSIONID", session
							.getAttribute("sessionid").toString()))
					.post(String.class, form);
			if (result.equals("WrongAuthenCode")) {
				model.addAttribute("error", "Wrong AuthenCode;"
						+ authencode);
				return "login";
			} else {
				session.setAttribute("username", username);
				//get role
				String role=webResource
						.path("user/getRoleUser")
						.cookie(new NewCookie("JSESSIONID", session
								.getAttribute("sessionid").toString()))
						.post(String.class);
				session.setAttribute("role", role);
				String weblink = "redirect:/";
				switch (role) {
				case "User":
					weblink+="sinhvien";
					break;
				case "Admin" :
					weblink+="admin";
					break;
				}
				return weblink;
			}
		}
	}

	@RequestMapping(value = "/denied")
	public String denied() {
		return "denied";
	}

	@RequestMapping(value = "/login/failure")
	public String loginFailure(Model model) {
		String message = "Đăng nhập thất bại";
		logger.info("fail");
		model.addAttribute("error", message);
		return "login";
	}

	@RequestMapping(value = "/logout/success")
	public String logoutSuccess(Model model) {
		String message = "Đăng xuất thành công!";
		model.addAttribute("error", message);
		return "login";
	}

	@RequestMapping(value = "/sinhvien")
	public String getUserPage() {
		return "sinhvien";
	}

	@RequestMapping(value = "/admin")
	public String getAdminPage() {
		return "admin";
	}

	@RequestMapping(value = "/giangvien")
	public String getGVPage() {
		return "giangvien";
	}

	@RequestMapping(value = "/manager")
	public String getManagerPage() {
		return "manager";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String handlerLogout(Model model, HttpSession session) {
		String message = "Đăng xuất thành công!";
		model.addAttribute("error", message);
		session.removeAttribute("username");
		session.removeAttribute("role");
		return "login";
	}

	@RequestMapping(value = "changepwd", method = RequestMethod.GET)
	public String getchangePassword() {
		return "changepassword";
	}

	@RequestMapping(value = "changepwd", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String changePassword(HttpServletRequest request) {
		// lay pass word roi save
		String iduser = request.getParameter("iduser");
		User user = userService.findById(iduser);
		if (!user.getPassword().equals(request.getParameter("pwdold"))) {
			return "Mật khẩu hiện tại không dúng! Vui lòng nhập lại!.";
		}
		user.setPassword(request.getParameter("pwdnew"));
		userService.save(user);
		return "�?ổi mật khẩu thành công";
	}
}
