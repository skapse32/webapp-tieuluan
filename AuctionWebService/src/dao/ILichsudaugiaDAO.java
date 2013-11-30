package dao;

import java.sql.Timestamp;
import java.util.List;

/**
 * Interface for LichsudaugiaDAO.
 * @author MyEclipse Persistence Tools
 */

public interface ILichsudaugiaDAO {
		/**
	 Perform an initial save of a previously unsaved Lichsudaugia entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   ILichsudaugiaDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Lichsudaugia entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Lichsudaugia entity);
    /**
	 Delete a persistent Lichsudaugia entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   ILichsudaugiaDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Lichsudaugia entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Lichsudaugia entity);
   /**
	 Persist a previously saved Lichsudaugia entity and return it or a copy of it to the sender. 
	 A copy of the Lichsudaugia entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = ILichsudaugiaDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Lichsudaugia entity to update
	 @return Lichsudaugia the persisted Lichsudaugia entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
	public Lichsudaugia update(Lichsudaugia entity);
	public Lichsudaugia findById( Long id);
	 /**
	 * Find all Lichsudaugia entities with a specific property value.  
	 
	  @param propertyName the name of the Lichsudaugia property to query
	  @param value the property value to match
	  	  @return List<Lichsudaugia> found by query
	 */
	public List<Lichsudaugia> findByProperty(String propertyName, Object value
		);
	public List<Lichsudaugia> findByNguoidat(Object nguoidat
		);
	public List<Lichsudaugia> findByGiadat(Object giadat
		);
	/**
	 * Find all Lichsudaugia entities.
	  	  @return List<Lichsudaugia> all Lichsudaugia entities
	 */
	public List<Lichsudaugia> findAll(
		);	
}