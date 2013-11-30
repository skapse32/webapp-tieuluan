package dao;

import java.util.List;
import java.util.Set;

/**
 * Interface for HinhthucthanhtoanDAO.
 * @author MyEclipse Persistence Tools
 */

public interface IHinhthucthanhtoanDAO {
		/**
	 Perform an initial save of a previously unsaved Hinhthucthanhtoan entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   IHinhthucthanhtoanDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hinhthucthanhtoan entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Hinhthucthanhtoan entity);
    /**
	 Delete a persistent Hinhthucthanhtoan entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   IHinhthucthanhtoanDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Hinhthucthanhtoan entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Hinhthucthanhtoan entity);
   /**
	 Persist a previously saved Hinhthucthanhtoan entity and return it or a copy of it to the sender. 
	 A copy of the Hinhthucthanhtoan entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = IHinhthucthanhtoanDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hinhthucthanhtoan entity to update
	 @return Hinhthucthanhtoan the persisted Hinhthucthanhtoan entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
	public Hinhthucthanhtoan update(Hinhthucthanhtoan entity);
	public Hinhthucthanhtoan findById( Long id);
	 /**
	 * Find all Hinhthucthanhtoan entities with a specific property value.  
	 
	  @param propertyName the name of the Hinhthucthanhtoan property to query
	  @param value the property value to match
	  	  @return List<Hinhthucthanhtoan> found by query
	 */
	public List<Hinhthucthanhtoan> findByProperty(String propertyName, Object value
		);
	public List<Hinhthucthanhtoan> findByTenhttt(Object tenhttt
		);
	public List<Hinhthucthanhtoan> findByMota(Object mota
		);
	/**
	 * Find all Hinhthucthanhtoan entities.
	  	  @return List<Hinhthucthanhtoan> all Hinhthucthanhtoan entities
	 */
	public List<Hinhthucthanhtoan> findAll(
		);	
}