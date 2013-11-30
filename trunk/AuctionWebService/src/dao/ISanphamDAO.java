package dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

/**
 * Interface for SanphamDAO.
 * @author MyEclipse Persistence Tools
 */

public interface ISanphamDAO {
		/**
	 Perform an initial save of a previously unsaved Sanpham entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   ISanphamDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Sanpham entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Sanpham entity);
    /**
	 Delete a persistent Sanpham entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   ISanphamDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Sanpham entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Sanpham entity);
   /**
	 Persist a previously saved Sanpham entity and return it or a copy of it to the sender. 
	 A copy of the Sanpham entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = ISanphamDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Sanpham entity to update
	 @return Sanpham the persisted Sanpham entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
	public Sanpham update(Sanpham entity);
	public Sanpham findById( Long id);
	 /**
	 * Find all Sanpham entities with a specific property value.  
	 
	  @param propertyName the name of the Sanpham property to query
	  @param value the property value to match
	  	  @return List<Sanpham> found by query
	 */
	public List<Sanpham> findByProperty(String propertyName, Object value
		);
	public List<Sanpham> findByTensp(Object tensp
		);
	public List<Sanpham> findBySoluong(Object soluong
		);
	public List<Sanpham> findByXuatxu(Object xuatxu
		);
	public List<Sanpham> findByThuonghieu(Object thuonghieu
		);
	public List<Sanpham> findByNguoidang(Object nguoidang
		);
	public List<Sanpham> findByGiakhoidiem(Object giakhoidiem
		);
	public List<Sanpham> findByGiahientai(Object giahientai
		);
	public List<Sanpham> findByNguoidat(Object nguoidat
		);
	public List<Sanpham> findByBuocgia(Object buocgia
		);
	public List<Sanpham> findByThongtinlienhe(Object thongtinlienhe
		);
	public List<Sanpham> findByHinhanh(Object hinhanh
		);
	public List<Sanpham> findByMota(Object mota
		);
	public List<Sanpham> findByTinhtrangdaugia(Object tinhtrangdaugia
		);
	public List<Sanpham> findByGhichu(Object ghichu
		);
	/**
	 * Find all Sanpham entities.
	  	  @return List<Sanpham> all Sanpham entities
	 */
	public List<Sanpham> findAll(
		);	
}