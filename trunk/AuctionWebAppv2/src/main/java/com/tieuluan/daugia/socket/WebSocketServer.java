package com.tieuluan.daugia.socket;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.NewCookie;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.representation.Form;
import com.tieuluan.daugia.function.Server;

public class WebSocketServer extends WebSocketServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static ArrayList<MyMessageInbound> mmiList = new ArrayList<MyMessageInbound>();
	
	@Override
	protected StreamInbound createWebSocketInbound(String arg0,
			HttpServletRequest arg1) {
		// TODO Auto-generated method stub
		return new MyMessageInbound();
	}
	
	private class MyMessageInbound extends MessageInbound{
		WsOutbound myoutBound;
		
		@Override
		protected void onClose(int status) {
			System.out.print("Close Client");
			mmiList.remove(this);
		}

		@Override
		protected void onOpen(WsOutbound outbound) {
			//1 client da ket noi toi server
			System.out.println("Open Client");
			//String json = getMessageJson(arg0.toString());
			this.myoutBound  = outbound;
			mmiList.add(this);
		}

		@Override
		protected void onBinaryMessage(ByteBuffer arg0) throws IOException {
			// TODO Auto-generated method stub
			
		}

		@Override
		protected void onTextMessage(CharBuffer arg0) throws IOException {
			// TODO Auto-generated method stub
			System.out.println("Accept Message : " + arg0);
			
			String json = getMessageJson(arg0.toString());
			
			for(MyMessageInbound mmib : mmiList){
				CharBuffer buffer = CharBuffer.wrap(json);
				mmib.myoutBound.writeTextMessage(buffer);
				mmib.myoutBound.flush();
			}
		}
		
		public String getMessageJson(String arg0){
			String[] message = arg0.toString().split(",");
			
			String masp= message[0];
			double giahientai = Double.parseDouble(message[1]);
			double buocgia = Double.parseDouble(message[2]);
			int numberbuocgia = Integer.parseInt(message[3]);
			double giadat=giahientai+(buocgia*numberbuocgia);
			String usename = message[4];
			String sessionVal = message[5];
			Date dtnow = new Date();
			
			ClientConfig config = new DefaultClientConfig();
			Client client = Client.create(config);
			WebResource webResource = client.resource(Server.addressAuctionWS);
			Form form = new Form();
			form.add("masp", masp);
			form.add("nguoidat", usename);
			form.add("thoigian", dtnow.getTime());
			form.add("giadat", giadat);
			ClientResponse response = null;
			response = webResource
					.path("lichsudaugia/datGia")
					.cookie(new NewCookie("JSESSIONID", sessionVal))
					.post(ClientResponse.class, form);
			return response.getEntity(String.class);
		}
	}
}
