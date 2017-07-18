package com.kryptos.npp.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import javax.transaction.Transactional;
//import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Filter;
import org.hibernate.HibernateException;
//import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.distapp.beans.Constants;
import com.kryptos.npp.model.*;
public class VendorDaoImpl implements VendorDao {

	@Autowired
	SessionFactory sessionFactory;

	Session session = null;
	
    
	public MtAgency getAgencyDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtAgency> mtAgencyList = session.createCriteria(MtAgency.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtAgencyList.get(0);
	}

	public MtAgency addMtAgency(MtAgency mtAgency) throws Exception {
		session = sessionFactory.openSession();
		session.save(mtAgency);
		//session.close();
		
		return mtAgency;
	}
	
	public String deleteAgency(String MtAgencyId) throws Exception 
	{
		String returnValue = Constants.SUCCESS;
	try {
			session = sessionFactory.openSession();
            session.beginTransaction();

            MtAgency mtAgency = (MtAgency) session.get(MtAgency.class, MtAgencyId);

            session.delete(mtAgency);

            session.getTransaction().commit();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
			returnValue = Constants.FAILED;
        }
		return returnValue;
	}

	public MtAgnNewsPaperBill getMtAgnNewsPaperBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtAgnNewsPaperBill> mtAgnNewsPaperBillList = session.createCriteria(MtAgnNewsPaperBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtAgnNewsPaperBillList.get(0);

	}

	public MtAgnNewsPaperBill addMtAgnNewsPaperBillDetails(MtAgnNewsPaperBill mtAgnNewsPaperBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtAgnNewsPaperBill);
		//session.close();
		
		return mtAgnNewsPaperBill;
	}

	public String deleteMtAgnNewsPaperBill(String MtAgnNewsPaperBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtAgnNewsPaperBill mtAgnNewsPaperBill = (MtAgnNewsPaperBill) session.get(MtAgnNewsPaperBill.class, MtAgnNewsPaperBillId);

	            session.delete(mtAgnNewsPaperBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtAgnNewsPaperMap getMtAgnNewsPaperMapDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtAgnNewsPaperMap> mtAgnNewsPaperMapList = session.createCriteria(MtAgnNewsPaperMap.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtAgnNewsPaperMapList.get(0);
	}

	public MtAgnNewsPaperMap addMtAgnNewsPaperMap(MtAgnNewsPaperMap mtAgnNewsPaperMap) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtAgnNewsPaperMap);
		//session.close();
		
		return mtAgnNewsPaperMap;
	}

	public String deleteMtAgnNewsPaperMap(String MtAgnNewsPaperMapId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtAgnNewsPaperMap mtAgnNewsPaperMap = (MtAgnNewsPaperMap) session.get(MtAgnNewsPaperMap.class, MtAgnNewsPaperMapId);

	            session.delete(mtAgnNewsPaperMap);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtAgnPaperStop getMtAgnPaperStopDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtAgnPaperStop> mtAgnPaperStopList = session.createCriteria(MtAgnPaperStop.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtAgnPaperStopList.get(0);
	}

	public MtAgnPaperStop addMtAgnPaperStop(MtAgnPaperStop mtAgnPaperStop) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtAgnPaperStop);
		//session.close();
		
		return mtAgnPaperStop;
	}

	public String deleteMtAgnPaperStop(String MtAgnPaperStopId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtAgnPaperStop mtAgnPaperStop = (MtAgnPaperStop) session.get(MtAgnPaperStop.class, MtAgnPaperStopId);

	            session.delete(mtAgnPaperStop);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtArea getMtAreaDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtArea> mtAreaList = session.createCriteria(MtArea.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtAreaList.get(0);
	}

	public MtArea addMtArea(MtArea mtArea) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtArea);
		//session.close();
		
		return mtArea;
	}

	public String deleteMtArea(String MtAreaId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtArea mtArea = (MtArea) session.get(MtArea.class, MtAreaId);

	            session.delete(mtArea);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
		return returnValue;

	}

	public MtCategory getMtCategoryDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtCategory> mtCategoryList = session.createCriteria(MtCategory.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtCategoryList.get(0);
	
	}

	public MtCategory addMtCategory(MtCategory mtCategory) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtCategory);
		//session.close();
		
		return mtCategory;
	}

	public String deleteMtCategory(String MtCategoryId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtCategory mtCategory = (MtCategory) session.get(MtCategory.class, MtCategoryId);

	            session.delete(mtCategory);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtCenter getMtCenterDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtCenter> mtCenterList = session.createCriteria(MtCenter.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtCenterList.get(0);
	}

	public MtCenter addMtCenter(MtCenter mtCenter) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtCenter);
		//session.close();
		
		return mtCenter;
	}

	public String deleteMtCenter(String MtCenterId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtCenter mtCenter = (MtCenter) session.get(MtCenter.class, MtCenterId);

	            session.delete(mtCenter);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtCommission getMtCommissionDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtCommission> mtCommissionList = session.createCriteria(MtCommission.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtCommissionList.get(0);
	}

	public MtCommission addMtCommission(MtCommission mtCommission) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtCommission);
		//session.close();
		
		return mtCommission;
	}

	public String deleteMtCommission(String MtCommissionId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtCommission mtCommission = (MtCommission) session.get(MtCommission.class, MtCommissionId);

	            session.delete(mtCommission);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtCommissionBill getMtCommissionBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtCommissionBill> mtCommissionBillList = session.createCriteria(MtCommissionBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtCommissionBillList.get(0);
		
	}

	public MtCommissionBill addMtCommissionBill(MtCommissionBill mtCommissionBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtCommissionBill);
		//session.close();
		
		return mtCommissionBill;
	}

	public String deleteMtCommissionBill(String MtCommissionBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtCommissionBill mtCommissionBill = (MtCommissionBill) session.get(MtCommissionBill.class, MtCommissionBillId);

	            session.delete(mtCommissionBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtCompany getMtCompanyDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtCompany> mtCompanyList = session.createCriteria(MtCompany.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtCompanyList.get(0);
	}

	public MtCompany addMtCompany(MtCompany mtCompany) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtCompany);
		//session.close();
		
		return mtCompany;
	}

	public String deleteMtCompany(String MtCompanyId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtCompany mtCompany = (MtCompany) session.get(MtCompany.class, MtCompanyId);

	            session.delete(mtCompany);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtDelivery getMtDeliveryDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtDelivery> mtDeliveryList = session.createCriteria(MtDelivery.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtDeliveryList.get(0);
	}

	public MtDelivery addMtDelivery(MtDelivery mtDelivery) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtDelivery);
		//session.close();
		
		return mtDelivery;
	}

	public String deleteMtDelivery(String MtDeliveryId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtDelivery mtDelivery = (MtDelivery) session.get(MtDelivery.class, MtDeliveryId);

	            session.delete(mtDelivery);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtDistentry getMtDistentryDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtDistentry> mtDistentryList = session.createCriteria(MtDistentry.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtDistentryList.get(0);
	}

	public MtDistentry addMtDistentry(MtDistentry mtDistentry) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtDistentry);
		//session.close();
		
		return mtDistentry;
	}

	public String deleteMtDistentry(String MtDistentryId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtDistentry mtDistentry = (MtDistentry) session.get(MtDistentry.class, MtDistentryId);

	            session.delete(mtDistentry);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtExecutive getMtExecutiveDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtExecutive> mtExecutiveList = session.createCriteria(MtExecutive.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtExecutiveList.get(0);
	}

	public MtExecutive addMtExecutive(MtExecutive mtExecutive) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtExecutive);
		//session.close();
		
		return mtExecutive;
	}

	public String deleteMtExecutive(String MtExecutiveId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtExecutive mtExecutive = (MtExecutive) session.get(MtExecutive.class, MtExecutiveId);

	            session.delete(mtExecutive);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtHoliday getMtHolidayDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtHoliday> mtHolidayList = session.createCriteria(MtHoliday.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtHolidayList.get(0);
	}

	public MtHoliday addMtHoliday(MtHoliday mtHoliday) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtHoliday);
		//session.close();
		
		return mtHoliday;
	}

	public String deleteMtHoliday(String MtHolidayId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtHoliday mtHoliday = (MtHoliday) session.get(MtHoliday.class, MtHolidayId);

	            session.delete(mtHoliday);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtPublication getMtPublicationDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtPublication> mtPublicationList = session.createCriteria(MtPublication.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtPublicationList.get(0);
	}

	public MtPublication addMtPublication(MtPublication mtPublication) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtPublication);
		//session.close();
		
		return mtPublication;
	}

	public String deleteMtPublication(String MtPublicationId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtPublication mtPublication = (MtPublication) session.get(MtPublication.class, MtPublicationId);

	            session.delete(mtPublication);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtPurrate getMtPurrateDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtPurrate> mtPurrateList = session.createCriteria(MtPurrate.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtPurrateList.get(0);
	}

	public MtPurrate addMtPurrate(MtPurrate mtPurrate) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtPurrate);
		//session.close();
		
		return mtPurrate;
	}

	public String deleteMtPurrate(String MtPurrateId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtPurrate mtPurrate = (MtPurrate) session.get(MtPurrate.class, MtPurrateId);

	            session.delete(mtPurrate);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtPurrateBill getMtPurrateBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtPurrateBill> mtPurrateBillList = session.createCriteria(MtPurrateBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtPurrateBillList.get(0);
	}

	public MtPurrateBill addMtPurrateBill(MtPurrateBill mtPurrateBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtPurrateBill);
		//session.close();
		
		return mtPurrateBill;
	}

	public String deleteMtPurrateBill(String MtPurrateBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtPurrateBill mtPurrateBill = (MtPurrateBill) session.get(MtPurrateBill.class, MtPurrateBillId);

	            session.delete(mtPurrateBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtRate getMtRateDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtRate> mtRateList = session.createCriteria(MtRate.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtRateList.get(0);
	}

	public MtRate addMtRate(MtRate mtRate) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtRate);
		//session.close();
		
		return mtRate;
	}

	public String deleteMtRate(String MtRateId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtRate mtRate = (MtRate) session.get(MtRate.class, MtRateId);

	            session.delete(mtRate);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtRateBill getMtRateBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtRateBill> mtRateBillList = session.createCriteria(MtRateBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtRateBillList.get(0);
	}

	public MtRateBill addMtRateBill(MtRateBill mtRateBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtRateBill);
		//session.close();
		
		return mtRateBill;
	}

	public String deleteMtRateBill(String MtRateBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtRateBill mtRateBill = (MtRateBill) session.get(MtRateBill.class, MtRateBillId);

	            session.delete(mtRateBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtRoute getMtRouteDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtRoute> mtRouteList = session.createCriteria(MtRoute.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtRouteList.get(0);
	}

	public MtRoute addMtRoute(MtRoute mtRoute) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtRoute);
		//session.close();
		
		return mtRoute;
	}

	public String deleteMtRoute(String MtRouteId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtRoute MtRoute = (MtRoute) session.get(MtRoute.class, MtRouteId);

	            session.delete(MtRoute);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtSupchrg getMtSupchrgDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtSupchrg> mtSupchrgList = session.createCriteria(MtSupchrg.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtSupchrgList.get(0);
		}

	public MtSupchrg addMtSupchrg(MtSupchrg mtSupchrg) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtSupchrg);
		//session.close();
		
		return mtSupchrg;
	}

	public String deleteMtSupchrg(String MtSupchrgId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtSupchrg mtSupchrg = (MtSupchrg) session.get(MtSupchrg.class, MtSupchrgId);

	            session.delete(mtSupchrg);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public MtSupchrgBill getMtSupchrgBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<MtSupchrgBill> mtSupchrgBillList = session.createCriteria(MtSupchrgBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return mtSupchrgBillList.get(0);
	}

	public MtSupchrgBill addMtSupchrgBill(MtSupchrgBill mtSupchrgBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(mtSupchrgBill);
		//session.close();
		
		return mtSupchrgBill;
	}

	public String deleteMtSupchrgBill(String MtSupchrgBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            MtSupchrgBill mtSupchrgBill = (MtSupchrgBill) session.get(MtSupchrgBill.class, MtSupchrgBillId);

	            session.delete(mtSupchrgBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public RpDetails getRpDetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<RpDetails> rpDetailsList = session.createCriteria(RpDetails.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return rpDetailsList.get(0);
	}

	public RpDetails addRpDetails(RpDetails rpDetails) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(rpDetails);
		//session.close();
		
		return rpDetails;
	}

	public String deleteRpDetails(String RpDetailsId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            RpDetails rpDetails = (RpDetails) session.get(RpDetails.class, RpDetailsId);

	            session.delete(rpDetails);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StBill getStBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StBill> stBillList = session.createCriteria(StBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stBillList.get(0);
	}

	public StBill addStBill(StBill stBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stBill);
		//session.close();
		
		return stBill;
	}

	public String deleteStBill(String StBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StBill stBill = (StBill) session.get(StBill.class, StBillId);

	            session.delete(stBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StDistributor getStDistributorDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StDistributor> stDistributorList = session.createCriteria(StDistributor.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stDistributorList.get(0);
	}

	public StDistributor addStDistributor(StDistributor stDistributor) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stDistributor);
		//session.close();
		
		return stDistributor;
	}

	public String deleteStDistributor(String StDistributorId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StDistributor stDistributor = (StDistributor) session.get(StDistributor.class, StDistributorId);

	            session.delete(stDistributor);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}
	public StDropdown getStDropdownDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StDropdown> stDropdownList = session.createCriteria(StDropdown.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stDropdownList.get(0);
	}

	public StDropdown addStDropdown(StDropdown stDropdown) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stDropdown);
		//session.close();
		
		return stDropdown;
	}

	public String deleteStDropdown(String StDropdownId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StDropdown stDropdown = (StDropdown) session.get(StDropdown.class, StDropdownId);

	            session.delete(stDropdown);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StFormdetails getStFormdetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StFormdetails> stFormdetailsList = session.createCriteria(StFormdetails.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stFormdetailsList.get(0);
	}

	public StFormdetails addStFormdetails(StFormdetails stFormdetails) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stFormdetails);
		//session.close();
		
		return stFormdetails;
	}

	public String deleteStFormdetails(String StFormdetailsId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StFormdetails StFormdetails = (StFormdetails) session.get(StFormdetails.class, StFormdetailsId);

	            session.delete(StFormdetails);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StMappings getStMappingsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StMappings> stMappingsList = session.createCriteria(StMappings.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stMappingsList.get(0);
	}

	public StMappings addStMappings(StMappings stMappings) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stMappings);
		//session.close();
		
		return stMappings;
	}

	public String deleteStMappings(String StMappingsId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StMappings StMappings = (StMappings) session.get(StMappings.class, StMappingsId);

	            session.delete(StMappings);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StSideMenu getStSideMenuDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StSideMenu> stSideMenuList = session.createCriteria(StSideMenu.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stSideMenuList.get(0);
	}

	public StSideMenu addStSideMenu(StSideMenu stSideMenu) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stSideMenu);
		//session.close();
		
		return stSideMenu;
	}

	public String deleteStSideMenu(String StSideMenuId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StSideMenu stSideMenu = (StSideMenu) session.get(StSideMenu.class, StSideMenuId);

	            session.delete(stSideMenu);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StSubMenu getStSubMenuDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StSubMenu> stSubMenuList = session.createCriteria(StSubMenu.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stSubMenuList.get(0);
	}

	public StSubMenu addStSubMenu(StSubMenu stSubMenu) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stSubMenu);
		//session.close();
		
		return stSubMenu;
	}

	public String deleteStSubMenu(String StSubMenuId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StSubMenu stSubMenu = (StSubMenu) session.get(StSubMenu.class, StSubMenuId);

	            session.delete(stSubMenu);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StSystemInfo getStSystemInfoDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StSystemInfo> stSystemInfoList = session.createCriteria(StSystemInfo.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stSystemInfoList.get(0);
	}

	public StSystemInfo addStSystemInfo(StSystemInfo stSystemInfo) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stSystemInfo);
		//session.close();
		
		return stSystemInfo;
	}

	public String deleteStSystemInfo(String StSystemInfoId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StSystemInfo stSystemInfo = (StSystemInfo) session.get(StSystemInfo.class, StSystemInfoId);

	            session.delete(stSystemInfo);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StTopMenu getStTopMenuDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StTopMenu> stTopMenuList = session.createCriteria(StTopMenu.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stTopMenuList.get(0);
	}

	public StTopMenu addStTopMenu(StTopMenu stTopMenu) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stTopMenu);
		//session.close();
		
		return stTopMenu;
	}

	public String deleteStTopMenu(String StTopMenuId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StTopMenu stTopMenu = (StTopMenu) session.get(StTopMenu.class, StTopMenuId);

	            session.delete(stTopMenu);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) { 
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StUser getStUserDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StUser> stUserList = session.createCriteria(StUser.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stUserList.get(0);
	}

	public StUser addStUser(StUser stUser) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stUser);
		//session.close();
		
		return stUser;
	}

	public String deleteStUser(String StUserId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StUser stUser = (StUser) session.get(StUser.class, StUserId);

	            session.delete(stUser);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public StUserCenters getStUserCentersDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<StUserCenters> stUserCentersList = session.createCriteria(StUserCenters.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return stUserCentersList.get(0);
	}

	public StUserCenters addStUserCenters(StUserCenters stUserCenters) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(stUserCenters);
		//session.close();
		
		return stUserCenters;
	}

	public String deleteStUserCenters(String StUserCentersId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            StUserCenters stUserCenters = (StUserCenters) session.get(StUserCenters.class, StUserCentersId);

	            session.delete(stUserCenters);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public SystemParams getSystemParamsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<SystemParams> systemParamsList = session.createCriteria(SystemParams.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return systemParamsList.get(0);
	}

	public SystemParams addSystemParams(SystemParams systemParams) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(systemParams);
		//session.close();
		
		return systemParams;
	}

	public String deleteSystemParams(String SystemParamsId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            SystemParams systemParams = (SystemParams) session.get(SystemParams.class, SystemParamsId);

	            session.delete(systemParams);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public TrBill getTrBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<TrBill> trBillList = session.createCriteria(TrBill.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return trBillList.get(0);
	}

	public TrBill addTrBill(TrBill trBill) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(trBill);
		//session.close();
		
		return trBill;
	}

	public String deleteTrBill(String TrBillId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            TrBill trBill = (TrBill) session.get(TrBill.class, TrBillId);

	            session.delete(trBill);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public TrBillDetail getTrBillDetailDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<TrBillDetail> trBillDetailList = session.createCriteria(TrBillDetail.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return trBillDetailList.get(0);
	}

	public TrBillDetail addTrBillDetail(TrBillDetail trBillDetail) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(trBillDetail);
		//session.close();
		
		return trBillDetail;
	}

	public String deleteTrBillDetail(String TrBillDetailId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            TrBillDetail trBillDetail = (TrBillDetail) session.get(TrBillDetail.class, TrBillDetailId);

	            session.delete(trBillDetail);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;

	}

	public TrDailyUnsold getTrDailyUnsoldDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<TrDailyUnsold> trDailyUnsoldList = session.createCriteria(TrDailyUnsold.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return trDailyUnsoldList.get(0);
	}

	public TrDailyUnsold addTrDailyUnsold(TrDailyUnsold trDailyUnsold) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(trDailyUnsold);
		//session.close();
		
		return trDailyUnsold;
	}

	public String deleteTrDailyUnsold(String TrDailyUnsoldId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            TrDailyUnsold trDailyUnsold = (TrDailyUnsold) session.get(TrDailyUnsold.class, TrDailyUnsoldId);

	            session.delete(trDailyUnsold);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public TrPaycashDetails getTrPaycashDetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<TrPaycashDetails> trPaycashDetailsList = session.createCriteria(TrPaycashDetails.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return trPaycashDetailsList.get(0);
	}

	public TrPaycashDetails addTrPaycashDetails(TrPaycashDetails trPaycashDetails) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(trPaycashDetails);
		//session.close();
		
		return trPaycashDetails;
	}

	public String deleteTrPaycashDetails(String TrPaycashDetailsId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            TrPaycashDetails trPaycashDetails = (TrPaycashDetails) session.get(TrPaycashDetails.class, TrPaycashDetailsId);

	            session.delete(trPaycashDetails);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public TrPayCoup getTrPayCoupDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<TrPayCoup> trPayCoupList = session.createCriteria(TrPayCoup.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return trPayCoupList.get(0);
	}

	public TrPayCoup addTrPayCoup(TrPayCoup trPayCoup) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(trPayCoup);
		//session.close();
		
		return trPayCoup;
	}

	public String deleteTrPayCoup(String TrPayCoupId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            TrPayCoup trPayCoup = (TrPayCoup) session.get(TrPayCoup.class, TrPayCoupId);

	            session.delete(trPayCoup);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}

	public TrPayDetails getTrPayDetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<TrPayDetails> trPayDetailsList = session.createCriteria(TrPayDetails.class).add(
								Restrictions.eq( "vendorId", vendorId )).list();
		//session.close();
		return trPayDetailsList.get(0);
	}

	public TrPayDetails addTrPayDetails(TrPayDetails trPayDetails) throws Exception {
		// TODO Auto-generated method stub
		session = sessionFactory.openSession();
		session.save(trPayDetails);
		//session.close();
		
		return trPayDetails;
	}

	public String deleteTrPayDetails(String TrPayDetailsId) throws Exception {
		// TODO Auto-generated method stub
		String returnValue = Constants.SUCCESS;
		try {
				session = sessionFactory.openSession();
	            session.beginTransaction();

	            TrPayDetails trPayDetails = (TrPayDetails) session.get(TrPayDetails.class, TrPayDetailsId);

	            session.delete(trPayDetails);

	            session.getTransaction().commit();
	        }
	        catch (HibernateException e) {
	            e.printStackTrace();
	            session.getTransaction().rollback();
				returnValue = Constants.FAILED;
	        }
			return returnValue;
	}
	
}
