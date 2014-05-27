package dao;

import java.util.List;

import domain.Hangxe;

public interface IHangxeDAO {
	public void save(Hangxe entity);

	public void delete(Hangxe entity);

	public Hangxe update(Hangxe entity);

	public Hangxe findById(int id);

	public List<Hangxe> findByProperty(String propertyName, Object value);

	public List<Hangxe> findAll();
}
