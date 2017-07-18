
package com.kryptos.npp.services;

import java.util.List;
import com.kryptos.npp.model.*;
import com.kryptos.npp.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
//import javax.transaction.Transactional;
//import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Filter;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.distapp.beans.Constants;

public class VendorServiceImpl implements VendorService {

	@Autowired
	VendorDao vendorDao;

	public MtAgency getAgencyDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getAgencyDetails(vendorId);
	}

	public MtAgency addMtAgency(MtAgency mtAgency) throws Exception {
		return vendorDao.addMtAgency(mtAgency);
	}
 
	public String deleteAgency(String MtAgencyId) throws Exception{
		// TODO Auto-generated method stub
		return vendorDao.deleteAgency(MtAgencyId);
	}

	public MtAgnNewsPaperBill getMtAgnNewsPaperBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtAgnNewsPaperBillDetails(vendorId);
	}

	public MtAgnNewsPaperBill addMtAgnNewsPaperBillDetails(MtAgnNewsPaperBill mtAgnNewsPaperBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtAgnNewsPaperBillDetails(mtAgnNewsPaperBill);
	}

	public String deleteMtAgnNewsPaperBill(String MtAgnNewsPaperBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtAgnNewsPaperBill(MtAgnNewsPaperBillId);
	}

	public MtAgnNewsPaperMap getMtAgnNewsPaperMapDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtAgnNewsPaperMapDetails(vendorId);
	}

	public MtAgnNewsPaperMap addMtAgnNewsPaperMap(MtAgnNewsPaperMap mtAgnNewsPaperMap) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtAgnNewsPaperMap(mtAgnNewsPaperMap);
	}

	public String deleteMtAgnNewsPaperMap(String MtAgnNewsPaperMapId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtAgnNewsPaperMap(MtAgnNewsPaperMapId);
	}

	public MtAgnPaperStop getMtAgnPaperStopDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtAgnPaperStopDetails(vendorId);
	}

	public MtAgnPaperStop addMtAgnPaperStop(MtAgnPaperStop mtAgnPaperStop) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtAgnPaperStop(mtAgnPaperStop) ;
	}

	public String deleteMtAgnPaperStop(String MtAgnPaperStopId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtAgnPaperStop(MtAgnPaperStopId);
	}

	public MtArea getMtAreaDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtAreaDetails(vendorId);
	}

	public MtArea addMtArea(MtArea mtArea) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtArea(mtArea);
	}

	public String deleteMtArea(String MtAreaId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtArea(MtAreaId);
	}

	public MtCategory getMtCategoryDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtCategoryDetails(vendorId);
	}

	public MtCategory addMtCategory(MtCategory mtCategory) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtCategory(mtCategory);
	}

	public String deleteMtCategory(String MtCategoryId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtCategory(MtCategoryId);
	}

	public MtCenter getMtCenterDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtCenterDetails(vendorId);
	}

	public MtCenter addMtCenter(MtCenter mtCenter) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtCenter(mtCenter);
	}

	public String deleteMtCenter(String MtCenterId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtCenter(MtCenterId);
	}

	public MtCommission getMtCommissionDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtCommissionDetails(vendorId);
	}

	public MtCommission addMtCommission(MtCommission mtCommission) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtCommission(mtCommission);
	}

	public String deleteMtCommission(String MtCommissionId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtCommission(MtCommissionId);
	}

	public MtCommissionBill getMtCommissionBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtCommissionBillDetails(vendorId);
	}

	public MtCommissionBill addMtCommissionBill(MtCommissionBill mtCommissionBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtCommissionBill(mtCommissionBill);
	}

	public String deleteMtCommissionBill(String MtCommissionBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtCommissionBill(MtCommissionBillId);
	}

	public MtCompany getMtCompanyDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtCompanyDetails(vendorId);
	}

	public MtCompany addMtCompany(MtCompany mtCompany) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtCompany(mtCompany);
	}

	public String deleteMtCompany(String MtCompanyId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtCompany(MtCompanyId);
	}

	public MtDelivery getMtDeliveryDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtDeliveryDetails(vendorId);
	}

	public MtDelivery addMtDelivery(MtDelivery mtDelivery) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtDelivery(mtDelivery);
	}

	public String deleteMtDelivery(String MtDeliveryId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtDelivery(MtDeliveryId);
	}

	public MtDistentry getMtDistentryDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtDistentryDetails(vendorId);
	}

	public MtDistentry addMtDistentry(MtDistentry mtDistentry) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtDistentry(mtDistentry);
	}

	public String deleteMtDistentry(String MtDistentryId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtDistentry(MtDistentryId);
	}

	public MtExecutive getMtExecutiveDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtExecutiveDetails(vendorId);
	}

	public MtExecutive addMtExecutive(MtExecutive mtExecutive) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtExecutive(mtExecutive);
	}

	public String deleteMtExecutive(String MtExecutiveId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtExecutive(MtExecutiveId);
	}

	public MtHoliday getMtHolidayDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtHolidayDetails(vendorId);
	}

	public MtHoliday addMtHoliday(MtHoliday mtHoliday) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtHoliday(mtHoliday);
	}

	public String deleteMtHoliday(String MtHolidayId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtHoliday(MtHolidayId);
	}

	public MtPublication getMtPublicationDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtPublicationDetails(vendorId);
	}

	public MtPublication addMtPublication(MtPublication mtPublication) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtPublication(mtPublication);
	}

	public String deleteMtPublication(String MtPublicationId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtPublication(MtPublicationId);
	}

	public MtPurrate getMtPurrateDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtPurrateDetails(vendorId);
	}

	public MtPurrate addMtPurrate(MtPurrate mtPurrate) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtPurrate(mtPurrate);
	}

	public String deleteMtPurrate(String MtPurrateId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtPurrate(MtPurrateId);
	}

	public MtPurrateBill getMtPurrateBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtPurrateBillDetails(vendorId);
	}

	public MtPurrateBill addMtPurrateBill(MtPurrateBill mtPurrateBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtPurrateBill(mtPurrateBill);
	}

	public String deleteMtPurrateBill(String MtPurrateBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtPurrateBill(MtPurrateBillId);
	}

	public MtRate getMtRateDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtRateDetails(vendorId);
	}

	public MtRate addMtRate(MtRate mtRate) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtRate(mtRate);
	}

	public String deleteMtRate(String MtRateId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtRate(MtRateId);
	}

	public MtRateBill getMtRateBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtRateBillDetails(vendorId);
	}

	public MtRateBill addMtRateBill(MtRateBill mtRateBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtRateBill(mtRateBill);
	}

	public String deleteMtRateBill(String MtRateBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtRateBill(MtRateBillId);
	}

	public MtRoute getMtRouteDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtRouteDetails(vendorId);
	}

	public MtRoute addMtRoute(MtRoute mtRoute) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtRoute(mtRoute);
	}

	public String deleteMtRoute(String MtRouteId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtRoute(MtRouteId);
	}

	public MtSupchrg getMtSupchrgDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtSupchrgDetails(vendorId);
	}

	public MtSupchrg addMtSupchrg(MtSupchrg mtSupchrg) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtSupchrg(mtSupchrg);
	}

	public String deleteMtSupchrg(String MtSupchrgId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtSupchrg(MtSupchrgId);
	}

	public MtSupchrgBill getMtSupchrgBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getMtSupchrgBillDetails(vendorId);
	}

	public MtSupchrgBill addMtSupchrgBill(MtSupchrgBill mtSupchrgBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addMtSupchrgBill(mtSupchrgBill);
	}

	public String deleteMtSupchrgBill(String MtSupchrgBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteMtSupchrgBill(MtSupchrgBillId);
	}

	public RpDetails getRpDetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getRpDetailsDetails(vendorId);
	}

	public RpDetails addRpDetails(RpDetails rpDetails) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addRpDetails(rpDetails);
	}

	public String deleteRpDetails(String RpDetailsId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteRpDetails(RpDetailsId);
	}

	public StBill getStBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStBillDetails(vendorId);
	}

	public StBill addStBill(StBill stBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStBill(stBill);
	}

	public String deleteStBill(String StBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStBill(StBillId);
	}

	public StDistributor getStDistributorDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStDistributorDetails(vendorId);
	}

	public StDistributor addStDistributor(StDistributor stDistributor) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStDistributor(stDistributor);
	}

	public String deleteStDistributor(String StDistributorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStDistributor(StDistributorId);
	}

	public StDropdown getStDropdownDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStDropdownDetails(vendorId);
	}

	public StDropdown addStDropdown(StDropdown stDropdown) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStDropdown(stDropdown);
	}

	public String deleteStDropdown(String StDropdownId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStDropdown(StDropdownId);
	}

	public StFormdetails getStFormdetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStFormdetailsDetails(vendorId);
	}

	public StFormdetails addStFormdetails(StFormdetails stFormdetails) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStFormdetails(stFormdetails);
	}

	public String deleteStFormdetails(String StFormdetailsId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStFormdetails(StFormdetailsId);
	}

	public StMappings getStMappingsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStMappingsDetails(vendorId);
	}

	public StMappings addStMappings(StMappings stMappings) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStMappings(stMappings);
	}

	public String deleteStMappings(String StMappingsId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStMappings(StMappingsId);
	}

	public StSideMenu getStSideMenuDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStSideMenuDetails(vendorId);
	}

	public StSideMenu addStSideMenu(StSideMenu stSideMenu) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStSideMenu(stSideMenu);
	}

	public String deleteStSideMenu(String StSideMenuId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStSideMenu(StSideMenuId);
	}

	public StSubMenu getStSubMenuDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStSubMenuDetails(vendorId);
	}

	public StSubMenu addStSubMenu(StSubMenu stSubMenu) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStSubMenu(stSubMenu);
	}

	public String deleteStSubMenu(String StSubMenuId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStSubMenu(StSubMenuId);
	}

	public StSystemInfo getStSystemInfoDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStSystemInfoDetails(vendorId);
	}

	public StSystemInfo addStSystemInfo(StSystemInfo stSystemInfo) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStSystemInfo(stSystemInfo);
	}

	public String deleteStSystemInfo(String StSystemInfoId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStSystemInfo(StSystemInfoId);
	}

	public StTopMenu getStTopMenuDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStTopMenuDetails(vendorId);
	}

	public StTopMenu addStTopMenu(StTopMenu stTopMenu) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStTopMenu(stTopMenu);
	}

	public String deleteStTopMenu(String StTopMenuId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStTopMenu(StTopMenuId);
	}

	public StUser getStUserDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStUserDetails(vendorId);
	}

	public StUser addStUser(StUser stUser) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStUser(stUser);
	}

	public String deleteStUser(String StUserId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStUser(StUserId);
	}

	public StUserCenters getStUserCentersDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getStUserCentersDetails(vendorId);
	}

	public StUserCenters addStUserCenters(StUserCenters stUserCenters) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addStUserCenters(stUserCenters);
	}

	public String deleteStUserCenters(String StUserCentersId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteStUserCenters(StUserCentersId);
	}

	public SystemParams getSystemParamsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getSystemParamsDetails(vendorId);
	}

	public SystemParams addSystemParams(SystemParams systemParams) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addSystemParams(systemParams);
	}

	public String deleteSystemParams(String SystemParamsId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteSystemParams(SystemParamsId);
	}

	public TrBill getTrBillDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getTrBillDetails(vendorId);
	}

	public TrBill addTrBill(TrBill trBill) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addTrBill(trBill);
	}

	public String deleteTrBill(String TrBillId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteTrBill(TrBillId);
	}

	public TrBillDetail getTrBillDetailDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getTrBillDetailDetails(vendorId);
	}

	public TrBillDetail addTrBillDetail(TrBillDetail trBillDetail) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addTrBillDetail(trBillDetail);
	}

	public String deleteTrBillDetail(String TrBillDetailId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteTrBillDetail(TrBillDetailId);
	}

	public TrDailyUnsold getTrDailyUnsoldDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getTrDailyUnsoldDetails(vendorId);
	}

	public TrDailyUnsold addTrDailyUnsold(TrDailyUnsold trDailyUnsold) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addTrDailyUnsold(trDailyUnsold);
	}

	public String deleteTrDailyUnsold(String TrDailyUnsoldId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteTrDailyUnsold(TrDailyUnsoldId);
	}

	public TrPaycashDetails getTrPaycashDetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getTrPaycashDetailsDetails(vendorId);
	}

	public TrPaycashDetails addTrPaycashDetails(TrPaycashDetails trPaycashDetails) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addTrPaycashDetails(trPaycashDetails);
	}

	public String deleteTrPaycashDetails(String TrPaycashDetailsId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteTrPaycashDetails(TrPaycashDetailsId);
	}

	public TrPayCoup getTrPayCoupDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getTrPayCoupDetails(vendorId);
	}

	public TrPayCoup addTrPayCoup(TrPayCoup trPayCoup) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addTrPayCoup(trPayCoup);
	}

	public String deleteTrPayCoup(String TrPayCoupId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteTrPayCoup(TrPayCoupId);
	}

	public TrPayDetails getTrPayDetailsDetails(String vendorId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.getTrPayDetailsDetails(vendorId);
	}

	public TrPayDetails addTrPayDetails(TrPayDetails trPayDetails) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.addTrPayDetails(trPayDetails);
	}

	public String deleteTrPayDetails(String TrPayDetailsId) throws Exception {
		// TODO Auto-generated method stub
		return vendorDao.deleteTrPayDetails(TrPayDetailsId);
	}

	
}
