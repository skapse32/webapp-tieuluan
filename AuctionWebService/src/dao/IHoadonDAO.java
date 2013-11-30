package dao;

import java.util.Date;
import java.util.List;

/**
 * Interface for HoadonDAO.
 * @author MyEclipse Persistence Tools
 */

public interface IHoadonDAO {
		/**
	 Perform an initial save of a previously unsaved Hoadon entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   IHoadonDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hoadon entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Hoadon entity);
    /**
	 Delete a persistent Hoadon entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   IHoadonDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Hoadon entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Hoadon entity);
   /**
	 Persist a previously saved Hoadon entity and return it or a copy of it to the sender. 
	 A copy of the Hoadon entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = IHoadonDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hoadon entity to update
	 @return Hoadon the persisted Hoadon entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
	public Hoadon update(Hoadon entity);
	public Hoadon findById( Long id);
	 /**
	 * Find all Hoadon entities with a specific property value.  
	 
	  @param propertyName the name of the Hoadon property to query
	  @param value the property value to match
	  	  @return List<Hoadon> found by query
	 */
	public List<Hoadon> findByProperty(String propertyName, Object value
		);
	public List<Hoadon> findByDongia(Object dongia
		);
	public List<Hoadon> findByNguoidang(Object nguoidang
		);
	public List<Hoadon> findByNguoimua(Object nguoimua
		);
	/**
	 * Find all Hoadon entities.
	  	  @return List<Hoadon> all Hoadon entities
	 */
	public List<Hoadon> findAll(
		);	
}