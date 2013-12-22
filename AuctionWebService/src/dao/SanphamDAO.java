package dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.eclipse.persistence.config.HintValues;
import org.eclipse.persistence.config.QueryHints;

/**
 * A data access object (DAO) providing persistence and search support for
 * Sanpham entities. Transaction control of the save(), update() and delete()
 * operations must be handled externally by senders of these methods or must be
 * manually added to each of these methods for data to be persisted to the JPA
 * datastore.
 * 
 * @see dao.Sanpham
 * @author MyEclipse Persistence Tools
 */

public class SanphamDAO implements ISanphamDAO {
	// property constants
	public static final String TENSP = "tensp";
	public static final String SOLUONG = "soluong";
	public static final String XUATXU = "xuatxu";
	public static final String THUONGHIEU = "thuonghieu";
	public static final String NGUOIDANG = "nguoidang";
	public static final String GIAKHOIDIEM = "giakhoidiem";
	public static final String GIAHIENTAI = "giahientai";
	public static final String GIAMUANGAY = "giamuangay";
	public static final String NGUOIDAT = "nguoidat";
	public static final String BUOCGIA = "buocgia";
	public static final String THONGTINLIENHE = "thongtinlienhe";
	public static final String HINHANH = "hinhanh";
	public static final String MOTA = "mota";
	public static final String TINHTRANGDAUGIA = "tinhtrangdaugia";
	public static final String GHICHU = "ghichu";

	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}

	/**
	 * Perform an initial save of a previously unsaved Sanpham entity. All
	 * subsequent persist actions of this entity should use the #update()
	 * method. This operation must be performed within the a database
	 * transaction context for the entity's data to be permanently saved to the
	 * persistence store, i.e., database. This method uses the
	 * {@link javax.persistence.EntityManager#persist(Object)
	 * EntityManager#persist} operation.
	 * 
	 * <pre>
	 * EntityManagerHelper.beginTransaction();
	 * SanphamDAO.save(entity);
	 * EntityManagerHelper.commit();
	 * </pre>
	 * 
	 * @param entity
	 *            Sanpham entity to persist
	 * @throws RuntimeException
	 *             when the operation fails
	 */
	public void save(Sanpham entity) {
		EntityManagerHelper.log("saving Sanpham instance", Level.INFO, null);
		try {
			getEntityManager().persist(entity);
			EntityManagerHelper.log("save successful", Level.INFO, null);
		} catch (RuntimeException re) {
			EntityManagerHelper.log("save failed", Level.SEVERE, re);
			throw re;
		}
	}

	/**
	 * Delete a persistent Sanpham entity. This operation must be performed
	 * within the a database transaction context for the entity's data to be
	 * permanently deleted from the persistence store, i.e., database. This
	 * method uses the {@link javax.persistence.EntityManager#remove(Object)
	 * EntityManager#delete} operation.
	 * 
	 * <pre>
	 * EntityManagerHelper.beginTransaction();
	 * SanphamDAO.delete(entity);
	 * EntityManagerHelper.commit();
	 * entity = null;
	 * </pre>
	 * 
	 * @param entity
	 *            Sanpham entity to delete
	 * @throws RuntimeException
	 *             when the operation fails
	 */
	public void delete(Sanpham entity) {
		EntityManagerHelper.log("deleting Sanpham instance", Level.INFO, null);
		try {
			entity = getEntityManager().getReference(Sanpham.class,
					entity.getMasp());
			getEntityManager().remove(entity);
			EntityManagerHelper.log("delete successful", Level.INFO, null);
		} catch (RuntimeException re) {
			EntityManagerHelper.log("delete failed", Level.SEVERE, re);
			throw re;
		}
	}

	/**
	 * Persist a previously saved Sanpham entity and return it or a copy of it
	 * to the sender. A copy of the Sanpham entity parameter is returned when
	 * the JPA persistence mechanism has not previously been tracking the
	 * updated entity. This operation must be performed within the a database
	 * transaction context for the entity's data to be permanently saved to the
	 * persistence store, i.e., database. This method uses the
	 * {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge}
	 * operation.
	 * 
	 * <pre>
	 * EntityManagerHelper.beginTransaction();
	 * entity = SanphamDAO.update(entity);
	 * EntityManagerHelper.commit();
	 * </pre>
	 * 
	 * @param entity
	 *            Sanpham entity to update
	 * @return Sanpham the persisted Sanpham entity instance, may not be the
	 *         same
	 * @throws RuntimeException
	 *             if the operation fails
	 */
	public Sanpham update(Sanpham entity) {
		EntityManagerHelper.log("updating Sanpham instance", Level.INFO, null);
		try {
			Sanpham result = getEntityManager().merge(entity);
			EntityManagerHelper.log("update successful", Level.INFO, null);
			return result;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("update failed", Level.SEVERE, re);
			throw re;
		}
	}

	public Sanpham findById(Long id) {
		EntityManagerHelper.log("finding Sanpham instance with id: " + id,
				Level.INFO, null);
		try {
			getEntityManager().clear();
			Sanpham instance = getEntityManager().find(Sanpham.class, id);
			return instance;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find failed", Level.SEVERE, re);
			throw re;
		}
	}

	/**
	 * Find all Sanpham entities with a specific property value.
	 * 
	 * @param propertyName
	 *            the name of the Sanpham property to query
	 * @param value
	 *            the property value to match
	 * @return List<Sanpham> found by query
	 */
	@SuppressWarnings("unchecked")
	public List<Sanpham> findByProperty(String propertyName, final Object value) {
		EntityManagerHelper.log("finding Sanpham instance with property: "
				+ propertyName + ", value: " + value, Level.INFO, null);
		try {
			final String queryString = "select model from Sanpham model where model."
					+ propertyName + "= :propertyValue";
			Query query = getEntityManager().createQuery(queryString);
			query.setParameter("propertyValue", value);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	public List<Sanpham> findByTensp(Object tensp) {
		return findByProperty(TENSP, tensp);
	}

	public List<Sanpham> findBySoluong(Object soluong) {
		return findByProperty(SOLUONG, soluong);
	}

	public List<Sanpham> findByXuatxu(Object xuatxu) {
		return findByProperty(XUATXU, xuatxu);
	}

	public List<Sanpham> findByNguoidang(Object nguoidang) {
		return findByProperty(NGUOIDANG, nguoidang);
	}

	public List<Sanpham> findByGiakhoidiem(Object giakhoidiem) {
		return findByProperty(GIAKHOIDIEM, giakhoidiem);
	}

	public List<Sanpham> findByGiahientai(Object giahientai) {
		return findByProperty(GIAHIENTAI, giahientai);
	}

	public List<Sanpham> findByNguoidat(Object nguoidat) {
		return findByProperty(NGUOIDAT, nguoidat);
	}

	public List<Sanpham> findByBuocgia(Object buocgia) {
		return findByProperty(BUOCGIA, buocgia);
	}

	public List<Sanpham> findByThongtinlienhe(Object thongtinlienhe) {
		return findByProperty(THONGTINLIENHE, thongtinlienhe);
	}

	public List<Sanpham> findByHinhanh(Object hinhanh) {
		return findByProperty(HINHANH, hinhanh);
	}

	public List<Sanpham> findByMota(Object mota) {
		return findByProperty(MOTA, mota);
	}

	public List<Sanpham> findByTinhtrangdaugia(Object tinhtrangdaugia) {
		return findByProperty(TINHTRANGDAUGIA, tinhtrangdaugia);
	}

	public List<Sanpham> findByGhichu(Object ghichu) {
		return findByProperty(GHICHU, ghichu);
	}

	/**
	 * Find all Sanpham entities.
	 * 
	 * @return List<Sanpham> all Sanpham entities
	 */
	public List<Sanpham> findByThuonghieu(int size, int page,
			String thuonghieu) {
		int n = (page - 1) * size;
		int m = size;
		EntityManagerHelper.log("finding Sanphams with size: " + size
				+ ", page: " + page, Level.INFO, null);
		try {
			String queryString = "";

				queryString = "select model from Sanpham model where  model.thoigianbatdau < CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 AND model.thuonghieu LIKE '"
						+ thuonghieu + "' ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			if (size != -1) {
				query.setFirstResult(n);
				query.setMaxResults(m);
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findAll() {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select model from Sanpham model";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	public int ketThucDauGia1() {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "UPDATE Sanpham sp SET sp.tinhtrangdaugia = '5' WHERE sp.thoigianketthuc < CURRENT_TIMESTAMP AND sp.tinhtrangdaugia = '0' ";
			getEntityManager().getTransaction().begin();
			Query query = getEntityManager().createQuery(queryString);
			int x = query.executeUpdate();
			getEntityManager().getTransaction().commit();
			return x;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findByKetThucDauGia() {
		EntityManagerHelper.log("finding all Sanpham end", Level.INFO, null);
		try {
			final String queryString = "select model from Sanpham model WHERE model.thoigianketthuc < CURRENT_TIMESTAMP AND model.tinhtrangdaugia = '0' ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	public Integer findSoSanPhamDangDau(long maloaisp) {

		EntityManagerHelper.log("finding Sanphams with maloaisp: " + maloaisp,
				Level.INFO, null);
		try {
			String queryString = "";
			if (maloaisp == -1)
				queryString = "select COUNT(model) from Sanpham model where  model.thoigianbatdau < CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 ";
			else
				queryString = "select COUNT(model) from Sanpham model where  model.thoigianbatdau < CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 AND model.loaisp.maloaisp= "
						+ maloaisp + " ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			int x = Integer.parseInt(query.getSingleResult().toString());
			return x;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findSanPhamDangDauTheoLoai(int size, int page,
			long maloaisp) {
		int n = (page - 1) * size;
		int m = size;
		EntityManagerHelper.log("finding Sanphams with size: " + size
				+ ", page: " + page, Level.INFO, null);
		try {
			String queryString = "";
			if (maloaisp == -1)
				queryString = "select model from Sanpham model where  model.thoigianbatdau < CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 ";
			else
				queryString = "select model from Sanpham model where  model.thoigianbatdau < CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 AND model.loaisp.maloaisp= "
						+ maloaisp + " ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			if (size != -1) {
				query.setFirstResult(n);
				query.setMaxResults(m);
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	public Integer findSoSanPhamSapDau(long maloaisp) {

		EntityManagerHelper.log("finding Sanphams with maloaisp: " + maloaisp,
				Level.INFO, null);
		try {
			String queryString = "";
			if (maloaisp == -1)
				queryString = "select COUNT(model) from Sanpham model where  model.thoigianbatdau > CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 ";
			else
				queryString = "select COUNT(model) from Sanpham model where  model.thoigianbatdau > CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 AND model.loaisp.maloaisp= "
						+ maloaisp + " ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			int x = Integer.parseInt(query.getSingleResult().toString());
			return x;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findSanPhamSapDauTheoLoai(int size, int page,
			long maloaisp) {
		int n = (page - 1) * size;
		int m = size;
		EntityManagerHelper.log("finding Sanphams with size: " + size
				+ ", page: " + page, Level.INFO, null);
		try {
			String queryString = "";
			if (maloaisp == -1)
				queryString = "select model from Sanpham model where  model.thoigianbatdau > CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 ";
			else
				queryString = "select model from Sanpham model where  model.thoigianbatdau > CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 AND model.loaisp.maloaisp= "
						+ maloaisp + " ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			if (size != -1) {
				query.setFirstResult(n);
				query.setMaxResults(m);
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	public Integer findSoSanPhamDaDau(long maloaisp) {
		EntityManagerHelper.log("finding Sanphams with maloaisp: " + maloaisp,
				Level.INFO, null);
		try {
			String queryString = "";
			if (maloaisp == -1)
				queryString = "select COUNT(model) from Sanpham model where   model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3 ";
			else
				queryString = "select COUNT(model) from Sanpham model where   model.loaisp.maloaisp= "
						+ maloaisp
						+ "  AND (model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3)";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			int x = Integer.parseInt(query.getSingleResult().toString());
			return x;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findSanPhamDaDauTheoLoai(int size, int page,
			long maloaisp) {
		int n = (page - 1) * size;
		int m = size;
		EntityManagerHelper.log("finding Sanphams with size: " + size
				+ ", page: " + page, Level.INFO, null);
		try {
			String queryString = "";
			if (maloaisp == -1)
				queryString = "select model from Sanpham model where   model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3 ";
			else
				queryString = "select model from Sanpham model where   model.loaisp.maloaisp= "
						+ maloaisp
						+ "  AND (model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3) ";

			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			if (size != -1) {
				query.setFirstResult(n);
				query.setMaxResults(m);
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamThamGiaKetThuc(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select DISTINCT model.sanpham from Lichsudaugia model where model.nguoidat = '"
					+ username + "' AND model.sanpham.tinhtrangdaugia = 1";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamThamGiaDangDau(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select DISTINCT model.sanpham from Lichsudaugia model where model.nguoidat = '"
					+ username + "' AND model.sanpham.tinhtrangdaugia = 0";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamChienThangChuaThanhToan(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidat = '"
					+ username + "' AND model.tinhtrangdaugia = 1";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamChienThangDaThanhToan(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidat = '"
					+ username + "' AND  model.tinhtrangdaugia = 3";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamChienThangAll(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidat = '"
					+ username
					+ "' AND (model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3)";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamCuaToiDangDau(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidang = '"
					+ username
					+ "' AND model.tinhtrangdaugia = 0 AND model.thoigianbatdau < CURRENT_TIMESTAMP ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamCuaToiBiHuy(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidang = '"
					+ username + "' AND model.tinhtrangdaugia = 2";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamCuaToiSapDau(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidang = '"
					+ username
					+ "' AND model.tinhtrangdaugia = 0 AND model.thoigianbatdau > CURRENT_TIMESTAMP ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamCuaToiDaDauXong(String username) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			final String queryString = "select  model from Sanpham model where model.nguoidang = '"
					+ username
					+ "' AND (model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3)";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findByTenSP(String tensp, int tinhtrang, int size,
			int page) {
		int n = (page - 1) * size;
		int m = size;
		EntityManagerHelper.log("finding Sanphams with size: " + size
				+ ", page: " + page, Level.INFO, null);
		try {
			String queryString = "";
			if (tinhtrang == 1) {
				queryString = "select  model from Sanpham model where UPPER(model.tensp) LIKE UPPER(:keyword)  AND model.tinhtrangdaugia = 0 AND model.thoigianbatdau < CURRENT_TIMESTAMP ";
			} else if (tinhtrang == 2) {
				queryString = "select  model from Sanpham model where UPPER(model.tensp) LIKE UPPER(:keyword)  AND model.tinhtrangdaugia = 0 AND model.thoigianbatdau > CURRENT_TIMESTAMP ";
			} else if (tinhtrang == 3) {
				queryString = "select  model from Sanpham model where UPPER(model.tensp) LIKE UPPER(:keyword) AND (model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3)";
			}
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			query.setParameter("keyword", "%" + tensp + "%");
			if (size != -1) {
				query.setFirstResult(n);
				query.setMaxResults(m);
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	public int findSoSPByTenSP(String tensp, int tinhtrang) {
		EntityManagerHelper.log("finding all Sanpham instances", Level.INFO,
				null);
		try {
			String queryString = "";
			if (tinhtrang == 1) {
				queryString = "select  COUNT(model) from Sanpham model where UPPER(model.tensp) LIKE UPPER(:keyword)  AND model.tinhtrangdaugia = 0 AND model.thoigianbatdau < CURRENT_TIMESTAMP ";
			} else if (tinhtrang == 2) {
				queryString = "select  COUNT(model) from Sanpham model where UPPER(model.tensp) LIKE UPPER(:keyword)  AND model.tinhtrangdaugia = 0 AND model.thoigianbatdau > CURRENT_TIMESTAMP ";
			} else if (tinhtrang == 3) {
				queryString = "select  COUNT(model) from Sanpham model where UPPER(model.tensp) LIKE UPPER(:keyword) AND (model.tinhtrangdaugia = 1 OR model.tinhtrangdaugia = 3)";
			}
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			query.setParameter("keyword", "%" + tensp + "%");
			int x = Integer.parseInt(query.getSingleResult().toString());
			return x;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamHuyAdmin(int tinhtrang) {

		EntityManagerHelper.log("finding Sanphams with size: ", Level.INFO,
				null);
		try {
			String queryString = "";
			if (tinhtrang == -1) {
				queryString = "select model from Sanpham model where   (model.thoigianbatdau > CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0) OR model.tinhtrangdaugia = 2 ";
			} else if (tinhtrang == 0) {
				queryString = "select model from Sanpham model where   model.thoigianbatdau > CURRENT_TIMESTAMP AND model.tinhtrangdaugia = 0 ";
			} else if (tinhtrang == 1) {
				queryString = "select model from Sanpham model where   model.tinhtrangdaugia = 2 ";
			}
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find all failed", Level.SEVERE, re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sanpham> findBySanPhamChoPhepDauAdmin() {

		EntityManagerHelper.log("finding Sanphams with size: ", Level.INFO,
				null);
		try {
			String queryString = "";
			queryString = "select model from Sanpham model where  model.tinhtrangdaugia = 4 ";
			Query query = getEntityManager().createQuery(queryString);
			query.setHint(QueryHints.REFRESH, HintValues.TRUE);
			return query.getResultList();
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find by property name failed",
					Level.SEVERE, re);
			throw re;
		}
	}

	@Override
	public List<Sanpham> findByThuonghieu(Object thuonghieu) {
		// TODO Auto-generated method stub
		return null;
	}

}