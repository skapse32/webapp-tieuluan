package com.nvh.daugia.service.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.nvh.daugia.model.jpa.SearchCriteria;
import com.nvh.daugia.model.jpa.SearchCriteriaPage;
import com.nvh.daugia.model.jpa.User;
import com.nvh.daugia.repository.UserRepository;
import com.nvh.daugia.service.UserService;

@Service("JpaUserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public User findById(String id) {
		// TODO Auto-generated method stub
		return userRepository.findOne(id);
	}

	@Override
	public User save(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}

	@Override
	public void delete(User contact) {
		// TODO Auto-generated method stub
		userRepository.delete(contact);
	}
	
	@Transactional(readOnly=true) 
	@Override
	public Page<User> findAllByPage(Pageable pageable) {
		// TODO Auto-generated method stub
		return userRepository.findAll(pageable);
	}

	@Transactional(readOnly=true) 
	@Override
	public Page<User> findUserByCriteria(SearchCriteria searchCriteria,
			Pageable pageable) {
		// TODO Auto-generated method stub
		String id = searchCriteria.getId();
		String hoten = searchCriteria.getHoten();
		int typeAccount = searchCriteria.getTypeacount();
		return userRepository.findUserByCriteria(id, hoten, typeAccount, pageable);
	}

	@Override
	public List<User> findByTypeAccount(int type) {
		// TODO Auto-generated method stub
		return userRepository.findUserByTypeaccount(type);
	}

	@Override
	public List<User> findByIdAndHoten(String id, String hoten) {
		// TODO Auto-generated method stub
		return userRepository.findByIdOrHoten(id, hoten);
	}

}
