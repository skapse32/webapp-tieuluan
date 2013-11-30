package dao;

import java.util.List;
import java.util.Set;

/**
 * Interface for TinhtrangspDAO.
 * @author MyEclipse Persistence Tools
 */

public interface ITinhtrangspDAO {
		/**
	 Perform an initial save of a previously unsaved Tinhtrangsp entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   ITinhtrangspDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Tinhtrangsp entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Tinhtrangsp entity);
    /**
	 Delete a persistent Tinhtrangsp entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   ITinhtrangspDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Tinhtrangsp entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Tinhtrangsp entity);
   /**
	 Persist a previously saved Tinhtrangsp entity and return it or a copy of it to the sender. 
	 A copy of the Tinhtrangsp entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = ITinhtrangspDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Tinhtrangsp entity to update
	 @return Tinhtrangsp the persisted Tinhtrangsp entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
	public Tinhtrangsp update(Tinhtrangsp entity);
	public Tinhtrangsp findById( Long id);
	 /**
	 * Find all Tinhtrangsp entities with a specific property value.  
	 
	  @param propertyName the name of the Tinhtrangsp property to query
	  @param value the property value to match
	  	  @return List<Tinhtrangsp> found by query
	 */
	public List<Tinhtrangsp> findByProperty(String propertyName, Object value
		);
	public List<Tinhtrangsp> findByTentinhtrangsp(Object tentinhtrangsp
		);
	public List<Tinhtrangsp> findByMota(Object mota
		);
	/**
	 * Find all Tinhtrangsp entities.
	  	  @return List<Tinhtrangsp> all Tinhtrangsp entities
	 */
	public List<Tinhtrangsp> findAll(
		);	
}