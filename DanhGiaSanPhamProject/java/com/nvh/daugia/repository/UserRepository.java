package com.nvh.daugia.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.nvh.daugia.model.jpa.User;

public interface UserRepository extends PagingAndSortingRepository<User, String> {

	//nhung phuong thuc dac bien trong day
	
	@Query("select e from User e where e.id like :id and e.hoten like :hoten and e.typeaccount = :typeaccount")
	public Page<User> findUserByCriteria(@Param("id") String id,
			                               @Param("hoten") String hoten,
			                               @Param("typeaccount") int typeaccount,
			                               Pageable pageable);
	
	public List<User> findUserByTypeaccount(int type);
	
	public List<User> findByIdOrHoten(String id, String hoten);
}
