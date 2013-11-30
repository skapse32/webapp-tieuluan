package dao;

import java.util.List;
import java.util.Set;

/**
 * Interface for LoaispDAO.
 * @author MyEclipse Persistence Tools
 */

public interface ILoaispDAO {
		/**
	 Perform an initial save of a previously unsaved Loaisp entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   ILoaispDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Loaisp entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Loaisp entity);
    /**
	 Delete a persistent Loaisp entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   ILoaispDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Loaisp entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Loaisp entity);
   /**
	 Persist a previously saved Loaisp entity and return it or a copy of it to the sender. 
	 A copy of the Loaisp entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = ILoaispDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Loaisp entity to update
	 @return Loaisp the persisted Loaisp entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
	public Loaisp update(Loaisp entity);
	public Loaisp findById( Long id);
	 /**
	 * Find all Loaisp entities with a specific property value.  
	 
	  @param propertyName the name of the Loaisp property to query
	  @param value the property value to match
	  	  @return List<Loaisp> found by query
	 */
	public List<Loaisp> findByProperty(String propertyName, Object value
		);
	public List<Loaisp> findByTenloaisp(Object tenloaisp
		);
	public List<Loaisp> findByMota(Object mota
		);
	/**
	 * Find all Loaisp entities.
	  	  @return List<Loaisp> all Loaisp entities
	 */
	public List<Loaisp> findAll(
		);	
}