package com.kryptos.npp.dao;
import java.util.List;
import com.kryptos.npp.model.*;

public interface VendorDao {
	public MtAgency getAgencyDetails(String vendorId) throws Exception;
	public MtAgency addMtAgency(MtAgency mtAgency) throws Exception;
	public String deleteAgency(String MtAgencyId) throws Exception;
	
	public MtAgnNewsPaperBill getMtAgnNewsPaperBillDetails(String vendorId) throws Exception;
	public MtAgnNewsPaperBill addMtAgnNewsPaperBillDetails(MtAgnNewsPaperBill mtAgnNewsPaperBill) throws Exception;
	public String deleteMtAgnNewsPaperBill(String MtAgnNewsPaperBillId) throws Exception;
	
	public MtAgnNewsPaperMap getMtAgnNewsPaperMapDetails(String vendorId) throws Exception;
	public MtAgnNewsPaperMap addMtAgnNewsPaperMap(MtAgnNewsPaperMap mtAgnNewsPaperMap) throws Exception;
	public String deleteMtAgnNewsPaperMap(String MtAgnNewsPaperMapId) throws Exception;
	
	public MtAgnPaperStop getMtAgnPaperStopDetails(String vendorId) throws Exception;
	public MtAgnPaperStop addMtAgnPaperStop(MtAgnPaperStop mtAgnPaperStop) throws Exception;
	public String deleteMtAgnPaperStop(String MtAgnPaperStopId) throws Exception;
	
	public MtArea getMtAreaDetails(String vendorId) throws Exception;
	public MtArea addMtArea(MtArea mtArea) throws Exception;
	public String deleteMtArea(String MtAreaId) throws Exception;
	
	public MtCategory getMtCategoryDetails(String vendorId) throws Exception;
	public MtCategory addMtCategory(MtCategory mtCategory) throws Exception;
	public String deleteMtCategory(String MtCategoryId) throws Exception;
	
	public MtCenter getMtCenterDetails(String vendorId) throws Exception;
	public MtCenter addMtCenter(MtCenter mtCenter) throws Exception;
	public String deleteMtCenter(String MtCenterId) throws Exception;
	
	public MtCommission getMtCommissionDetails(String vendorId) throws Exception;
	public MtCommission addMtCommission(MtCommission mtCommission) throws Exception;
	public String deleteMtCommission(String MtCommissionId) throws Exception;
	
	public MtCommissionBill getMtCommissionBillDetails(String vendorId) throws Exception;
	public MtCommissionBill addMtCommissionBill(MtCommissionBill mtCommissionBill) throws Exception;
	public String deleteMtCommissionBill(String MtCommissionBillId) throws Exception;
	
	public MtCompany getMtCompanyDetails(String vendorId) throws Exception;
	public MtCompany addMtCompany(MtCompany mtCompany) throws Exception;
	public String deleteMtCompany(String MtCompanyId) throws Exception;
	
	public MtDelivery getMtDeliveryDetails(String vendorId) throws Exception;
	public MtDelivery addMtDelivery(MtDelivery mtDelivery) throws Exception;
	public String deleteMtDelivery(String MtDeliveryId) throws Exception;
	
	public MtDistentry getMtDistentryDetails(String vendorId) throws Exception;
	public MtDistentry addMtDistentry(MtDistentry mtDistentry) throws Exception;
	public String deleteMtDistentry(String MtDistentryId) throws Exception;
	
	public MtExecutive getMtExecutiveDetails(String vendorId) throws Exception;
	public MtExecutive addMtExecutive(MtExecutive mtExecutive) throws Exception;
	public String deleteMtExecutive(String MtExecutiveId) throws Exception;
	
	public MtHoliday getMtHolidayDetails(String vendorId) throws Exception;
	public MtHoliday addMtHoliday(MtHoliday mtHoliday) throws Exception;
	public String deleteMtHoliday(String MtHolidayId) throws Exception;
	
	public MtPublication getMtPublicationDetails(String vendorId) throws Exception;
	public MtPublication addMtPublication(MtPublication mtPublication) throws Exception;
	public String deleteMtPublication(String MtPublicationId) throws Exception;
	
	public MtPurrate getMtPurrateDetails(String vendorId) throws Exception;
	public MtPurrate addMtPurrate(MtPurrate mtPurrate) throws Exception;
	public String deleteMtPurrate(String MtPurrateId) throws Exception;
	
	public MtPurrateBill getMtPurrateBillDetails(String vendorId) throws Exception;
	public MtPurrateBill addMtPurrateBill(MtPurrateBill mtPurrateBill) throws Exception;
	public String deleteMtPurrateBill(String MtPurrateBillId) throws Exception;
	
	public MtRate getMtRateDetails(String vendorId) throws Exception;
	public MtRate addMtRate(MtRate mtRate) throws Exception;
	public String deleteMtRate(String MtRateId) throws Exception;
	
	public MtRateBill getMtRateBillDetails(String vendorId) throws Exception;
	public MtRateBill addMtRateBill(MtRateBill mtRateBill) throws Exception;
	public String deleteMtRateBill(String MtRateBillId) throws Exception;
	
	public MtRoute getMtRouteDetails(String vendorId) throws Exception;
	public MtRoute addMtRoute(MtRoute mtRoute) throws Exception;
	public String deleteMtRoute(String MtRouteId) throws Exception;
	
	public MtSupchrg getMtSupchrgDetails(String vendorId) throws Exception;
	public MtSupchrg addMtSupchrg(MtSupchrg mtSupchrg) throws Exception;
	public String deleteMtSupchrg(String MtSupchrgId) throws Exception;
	
	public MtSupchrgBill getMtSupchrgBillDetails(String vendorId) throws Exception;
	public MtSupchrgBill addMtSupchrgBill(MtSupchrgBill mtSupchrgBill) throws Exception;
	public String deleteMtSupchrgBill(String MtSupchrgBillId) throws Exception;
	
	public RpDetails getRpDetailsDetails(String vendorId) throws Exception;
	public RpDetails addRpDetails(RpDetails rpDetails) throws Exception;
	public String deleteRpDetails(String RpDetailsId) throws Exception;
	
	public StBill getStBillDetails(String vendorId) throws Exception;
	public StBill addStBill(StBill stBill) throws Exception;
	public String deleteStBill(String StBillId) throws Exception;
	
	public StDistributor getStDistributorDetails(String vendorId) throws Exception;
	public StDistributor addStDistributor(StDistributor stDistributor) throws Exception;
	public String deleteStDistributor(String StDistributorId) throws Exception;
	
	public StDropdown getStDropdownDetails(String vendorId) throws Exception;
	public StDropdown addStDropdown(StDropdown stDropdown) throws Exception;
	public String deleteStDropdown(String StDropdownId) throws Exception;
	
	public StFormdetails getStFormdetailsDetails(String vendorId) throws Exception;
	public StFormdetails addStFormdetails(StFormdetails stFormdetails) throws Exception;
	public String deleteStFormdetails(String StFormdetailsId) throws Exception;
	
	public StMappings getStMappingsDetails(String vendorId) throws Exception;
	public StMappings addStMappings(StMappings stMappings) throws Exception;
	public String deleteStMappings(String StMappingsId) throws Exception;
	
	public StSideMenu getStSideMenuDetails(String vendorId) throws Exception;
	public StSideMenu addStSideMenu(StSideMenu stSideMenu) throws Exception;
	public String deleteStSideMenu(String StSideMenuId) throws Exception;
	
	public StSubMenu getStSubMenuDetails(String vendorId) throws Exception;
	public StSubMenu addStSubMenu(StSubMenu stSubMenu) throws Exception;
	public String deleteStSubMenu(String StSubMenuId) throws Exception;
	
	public StSystemInfo getStSystemInfoDetails(String vendorId) throws Exception;
	public StSystemInfo addStSystemInfo(StSystemInfo stSystemInfo) throws Exception;
	public String deleteStSystemInfo(String StSystemInfoId) throws Exception;
	
	public StTopMenu getStTopMenuDetails(String vendorId) throws Exception;
	public StTopMenu addStTopMenu(StTopMenu stTopMenu) throws Exception;
	public String deleteStTopMenu(String StTopMenuId) throws Exception;
	
	public StUser getStUserDetails(String vendorId) throws Exception;
	public StUser addStUser(StUser stUser) throws Exception;
	public String deleteStUser(String StUserId) throws Exception;
	
	public StUserCenters getStUserCentersDetails(String vendorId) throws Exception;
	public StUserCenters addStUserCenters(StUserCenters stUserCenters) throws Exception;
	public String deleteStUserCenters(String StUserCentersId) throws Exception;
	
	public SystemParams getSystemParamsDetails(String vendorId) throws Exception;
	public SystemParams addSystemParams(SystemParams systemParams) throws Exception;
	public String deleteSystemParams(String SystemParamsId) throws Exception;
	
	public TrBill getTrBillDetails(String vendorId) throws Exception;
	public TrBill addTrBill(TrBill trBill) throws Exception;
	public String deleteTrBill(String TrBillId) throws Exception;
	
	public TrBillDetail getTrBillDetailDetails(String vendorId) throws Exception;
	public TrBillDetail addTrBillDetail(TrBillDetail trBillDetail) throws Exception;
	public String deleteTrBillDetail(String TrBillDetailId) throws Exception;
	
	public TrDailyUnsold getTrDailyUnsoldDetails(String vendorId) throws Exception;
	public TrDailyUnsold addTrDailyUnsold(TrDailyUnsold trDailyUnsold) throws Exception;
	public String deleteTrDailyUnsold(String TrDailyUnsoldId) throws Exception;
	
	public TrPaycashDetails getTrPaycashDetailsDetails(String vendorId) throws Exception;
	public TrPaycashDetails addTrPaycashDetails(TrPaycashDetails trPaycashDetails) throws Exception;
	public String deleteTrPaycashDetails(String TrPaycashDetailsId) throws Exception;
	
	public TrPayCoup getTrPayCoupDetails(String vendorId) throws Exception;
	public TrPayCoup addTrPayCoup(TrPayCoup trPayCoup) throws Exception;
	public String deleteTrPayCoup(String TrPayCoupId) throws Exception;
	
	public TrPayDetails getTrPayDetailsDetails(String vendorId) throws Exception;
	public TrPayDetails addTrPayDetails(TrPayDetails trPayDetails) throws Exception;
	public String deleteTrPayDetails(String TrPayDetailsId) throws Exception;	

}



