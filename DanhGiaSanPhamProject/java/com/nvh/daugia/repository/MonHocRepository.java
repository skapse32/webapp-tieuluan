package com.nvh.daugia.repository;

import org.springframework.data.repository.CrudRepository;

import com.nvh.daugia.model.jpa.SanPham;

public interface MonHocRepository extends CrudRepository<SanPham, String> {

}
