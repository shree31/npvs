/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kryptos.npp.controller;
//import java.util.List;

import com.kryptos.npp.model.*;
import com.kryptos.npp.services.*;
//import com.kryptos.school.controller.RequestBody;
//import com.kryptos.school.model.Family;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import javax.transaction.Transactional;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
//import org.hibernate.Filter;
//import org.hibernate.HibernateException;
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.criterion.Restrictions;

import com.distapp.beans.Constants;
//import com.kryptos.npp.model.*;
/**
 *
 * @author Window 8
 */
@Controller
@RequestMapping(value="/api")
public class APIController {
	@Autowired
	VendorService vendorService;
	
	@RequestMapping(method = RequestMethod.GET,value = "/agencydetails")
	public @ResponseBody MtAgency getAgencyDetails(@FormParam("vendorId") String vendorId) {  
		  
		  MtAgency agency = null;  
		  try {  
			  agency = vendorService.getAgencyDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return agency;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/agency/add")
	public MtAgency addAgency(@RequestBody MtAgency mtAgency) {
		  try {  
		   return vendorService.addMtAgency(mtAgency);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/agency/delete")
	public String deleteAgency(@RequestBody String agencyId) {
		  try {  
			  vendorService.deleteAgency(agencyId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET, value ="/mtagnnewspaperbill")
	public @ResponseBody MtAgnNewsPaperBill getMtAgnNewsPaperBillDetails(@FormParam("vendorId") String vendorId)
	{
		MtAgnNewsPaperBill mtAgnNewsPaperBill = null;  
		  try {  
			  mtAgnNewsPaperBill = vendorService.getMtAgnNewsPaperBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtAgnNewsPaperBill; 
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtagnnewspaperbill/add")
	public MtAgnNewsPaperBill addMtAgnNewsPaperBillDetails(@RequestBody MtAgnNewsPaperBill mtAgnNewsPaperBill) {
		  try {  
		   return vendorService.addMtAgnNewsPaperBillDetails(mtAgnNewsPaperBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtagnnewspaperbill/delete")
	public String deleteMtAgnNewsPaperBill(@RequestBody String MtAgnNewsPaperBillId) {
		  try {  
			  vendorService.deleteMtAgnNewsPaperBill(MtAgnNewsPaperBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtagnnewspapermap")
	public @ResponseBody MtAgnNewsPaperMap getMtAgnNewsPaperMapDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtAgnNewsPaperMap mtAgnNewsPaperMap = null;  
		  try {  
			  mtAgnNewsPaperMap = vendorService.getMtAgnNewsPaperMapDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtAgnNewsPaperMap;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtagnnewspapermap/add")
	public MtAgnNewsPaperMap addMtAgnNewsPaperMap(@RequestBody MtAgnNewsPaperMap mtAgnNewsPaperMap) {
		  try {  
		   return vendorService.addMtAgnNewsPaperMap(mtAgnNewsPaperMap);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtagnnewspapermap/delete")
	public String deleteMtAgnNewsPaperMap(@RequestBody String MtAgnNewsPaperMapId) {
		  try {  
			  vendorService.deleteMtAgnNewsPaperMap(MtAgnNewsPaperMapId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtagnpaperstop")
	public @ResponseBody MtAgnPaperStop getMtAgnPaperStopDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtAgnPaperStop mtAgnPaperStop = null;  
		  try {  
			  mtAgnPaperStop = vendorService.getMtAgnPaperStopDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtAgnPaperStop;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtagnpaperstop/add")
	public MtAgnPaperStop addMtAgnPaperStop(@RequestBody MtAgnPaperStop mtAgnPaperStop) {
		  try {  
		   return vendorService.addMtAgnPaperStop(mtAgnPaperStop);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtagnpaperstop/delete")
	public String deleteMtAgnPaperStop(@RequestBody String MtAgnPaperStopId) {
		  try {  
			  vendorService.deleteMtAgnPaperStop(MtAgnPaperStopId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtarea")
	public @ResponseBody MtArea getMtAreaDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtArea mtArea = null;  
		  try {  
			  mtArea = vendorService.getMtAreaDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtArea;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtarea/add")
	public MtArea addMtArea(@RequestBody MtArea mtArea) {
		  try {  
		   return vendorService.addMtArea(mtArea);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtarea/delete")
	public String deleteMtArea(@RequestBody String MtAreaId) {
		  try {  
			  vendorService.deleteMtArea(MtAreaId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtcategory")
	public @ResponseBody MtCategory getMtCategoryDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtCategory mtCategory = null;  
		  try {  
			  mtCategory = vendorService.getMtCategoryDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtCategory;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtcategory/add")
	public MtCategory addMtCategory(@RequestBody MtCategory mtCategory) {
		  try {  
		   return vendorService.addMtCategory(mtCategory);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtcategory/delete")
	public String deleteMtCategory(@RequestBody String MtCategoryId) {
		  try {  
			  vendorService.deleteMtCategory(MtCategoryId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtcenter")
	public @ResponseBody MtCenter getMtCenterDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtCenter mtCenter = null;  
		  try {  
			  mtCenter = vendorService.getMtCenterDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtCenter;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtcenter/add")
	public MtCenter addMtCenter(@RequestBody MtCenter mtCenter) {
		  try {  
		   return vendorService.addMtCenter(mtCenter);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtcenter/delete")
	public String deleteMtCenter(@RequestBody String MtCenterId) {
		  try {  
			  vendorService.deleteMtCenter(MtCenterId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtcommission")
	public @ResponseBody MtCommission getMtCommissionDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtCommission mtCommission = null;  
		  try {  
			  mtCommission = vendorService.getMtCommissionDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtCommission;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtcommission/add")
	public MtCommission addMtCommission(@RequestBody MtCommission mtCommission) {
		  try {  
		   return vendorService.addMtCommission(mtCommission);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtcommission/delete")
	public String deleteMtCommission(@RequestBody String MtCommissionId) {
		  try {  
			  vendorService.deleteMtCommission(MtCommissionId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtcommissionbill")
	public @ResponseBody MtCommissionBill getMtCommissionBillDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtCommissionBill mtCommissionBill = null;  
		  try {  
			  mtCommissionBill = vendorService.getMtCommissionBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtCommissionBill;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtcommissionbill/add")
	public MtCommissionBill addMtCommissionBill(@RequestBody MtCommissionBill mtCommissionBill) {
		  try {  
		   return vendorService.addMtCommissionBill(mtCommissionBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtcommissionbill/delete")
	public String deleteMtCommissionBill(@RequestBody String MtCommissionBillId) {
		  try {  
			  vendorService.deleteMtCommissionBill(MtCommissionBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtcompany")
	public @ResponseBody MtCompany getMtCompanyDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtCompany mtCompany = null;  
		  try {  
			  mtCompany = vendorService.getMtCompanyDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtCompany;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtcompany/add")
	public MtCompany addMtCompany(@RequestBody MtCompany mtCompany) {
		  try {  
		   return vendorService.addMtCompany(mtCompany);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtcompany/delete")
	public String deleteMtCompany(@RequestBody String MtCompanyId) {
		  try {  
			  vendorService.deleteMtCompany(MtCompanyId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtdelivery")
	public @ResponseBody MtDelivery getMtDeliveryDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtDelivery mtDelivery = null;  
		  try {  
			  mtDelivery = vendorService.getMtDeliveryDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtDelivery;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtdelivery/add")
	public MtDelivery addMtDelivery(@RequestBody MtDelivery mtDelivery) {
		  try {  
		   return vendorService.addMtDelivery(mtDelivery);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtdelivery/delete")
	public String deleteMtDelivery(@RequestBody String MtDeliveryId) {
		  try {  
			  vendorService.deleteMtDelivery(MtDeliveryId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtdistentry")
	public @ResponseBody MtDistentry getMtDistentryDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtDistentry mtDistentry = null;  
		  try {  
			  mtDistentry = vendorService.getMtDistentryDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtDistentry;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtdistentry/add")
	public MtDistentry addMtDistentry(@RequestBody MtDistentry mtDistentry) {
		  try {  
		   return vendorService.addMtDistentry(mtDistentry);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtdistentry/delete")
	public String deleteMtDistentry(@RequestBody String MtDistentryId) {
		  try {  
			  vendorService.deleteMtDistentry(MtDistentryId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtexecutive")
	public @ResponseBody MtExecutive getMtExecutiveDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtExecutive mtExecutive = null;  
		  try {  
			  mtExecutive = vendorService.getMtExecutiveDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtExecutive;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtexecutive/add")
	public MtExecutive addMtExecutive(@RequestBody MtExecutive mtExecutive) {
		  try {  
		   return vendorService.addMtExecutive(mtExecutive);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtexecutive/delete")
	public String deleteMtExecutive(@RequestBody String MtExecutiveId) {
		  try {  
			  vendorService.deleteMtExecutive(MtExecutiveId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtholiday")
	public @ResponseBody MtHoliday getMtHolidayDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtHoliday mtHoliday = null;  
		  try {  
			  mtHoliday = vendorService.getMtHolidayDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtHoliday;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtholiday/add")
	public MtHoliday addMtHoliday(@RequestBody MtHoliday mtHoliday) {
		  try {  
		   return vendorService.addMtHoliday(mtHoliday);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtholiday/delete")
	public String deleteMtHoliday(@RequestBody String MtHolidayId) {
		  try {  
			  vendorService.deleteMtHoliday(MtHolidayId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtpublication")
	public @ResponseBody MtPublication getMtPublicationDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtPublication mtPublication = null;  
		  try {  
			  mtPublication = vendorService.getMtPublicationDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtPublication;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtpublication/add")
	public MtPublication addMtPublication(@RequestBody MtPublication mtPublication) {
		  try {  
		   return vendorService.addMtPublication(mtPublication);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtpublication/delete")
	public String deleteMtPublication(@RequestBody String MtPublicationId) {
		  try {  
			  vendorService.deleteMtPublication(MtPublicationId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtpurrate")
	public @ResponseBody MtPurrate getMtPurrateDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtPurrate mtPurrate = null;  
		  try {  
			  mtPurrate = vendorService.getMtPurrateDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtPurrate;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtpurrate/add")
	public MtPurrate addMtPurrate(@RequestBody MtPurrate mtPurrate) {
		  try {  
		   return vendorService.addMtPurrate(mtPurrate);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtpurrate/delete")
	public String deleteMtPurrate(@RequestBody String MtPurrateId) {
		  try {  
			  vendorService.deleteMtPurrate(MtPurrateId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtpurratebill")
	public @ResponseBody MtPurrateBill getMtPurrateBillDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtPurrateBill mtPurrateBill = null;  
		  try {  
			  mtPurrateBill = vendorService.getMtPurrateBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtPurrateBill;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtpurratebill/add")
	public MtPurrateBill addMtPurrateBill(@RequestBody MtPurrateBill mtPurrateBill) {
		  try {  
		   return vendorService.addMtPurrateBill(mtPurrateBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtpurratebill/delete")
	public String deleteMtPurrateBill(@RequestBody String MtPurrateBillId) {
		  try {  
			  vendorService.deleteMtPurrateBill(MtPurrateBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtrate")
	public @ResponseBody MtRate getMtRateDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtRate mtRate = null;  
		  try {  
			  mtRate = vendorService.getMtRateDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtRate;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtrate/add")
	public MtRate addMtRate(@RequestBody MtRate mtRate) {
		  try {  
		   return vendorService.addMtRate(mtRate);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtrate/delete")
	public String deleteMtRate(@RequestBody String MtRateId) {
		  try {  
			  vendorService.deleteMtRate(MtRateId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtratebill")
	public @ResponseBody MtRateBill getMtRateBillDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtRateBill mtRateBill = null;  
		  try {  
			  mtRateBill = vendorService.getMtRateBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtRateBill;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtratebill/add")
	public MtRateBill addMtRateBill(@RequestBody MtRateBill mtRateBill) {
		  try {  
		   return vendorService.addMtRateBill(mtRateBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtratebill/delete")
	public String deleteMtRateBill(@RequestBody String MtRateBillId) {
		  try {  
			  vendorService.deleteMtRateBill(MtRateBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtroute")
	public @ResponseBody MtRoute getMtRouteDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtRoute mtRoute = null;  
		  try {  
			  mtRoute = vendorService.getMtRouteDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtRoute;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtroute/add")
	public MtRoute addMtRoute(@RequestBody MtRoute mtRoute) {
		  try {  
		   return vendorService.addMtRoute(mtRoute);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtroute/delete")
	public String deleteMtRoute(@RequestBody String MtRouteId) {
		  try {  
			  vendorService.deleteMtRoute(MtRouteId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtsupchrg")
	public @ResponseBody MtSupchrg getMtSupchrgDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtSupchrg mtSupchrg = null;  
		  try {  
			  mtSupchrg = vendorService.getMtSupchrgDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtSupchrg;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtsupchrg/add")
	public MtSupchrg addMtSupchrg(@RequestBody MtSupchrg mtSupchrg) {
		  try {  
		   return vendorService.addMtSupchrg(mtSupchrg);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtsupchrg/delete")
	public String deleteMtSupchrg(@RequestBody String MtSupchrgId) {
		  try {  
			  vendorService.deleteMtSupchrg(MtSupchrgId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/mtsupchrgbill")
	public @ResponseBody MtSupchrgBill getMtSupchrgBillDetails(@FormParam("vendorId") String vendorId) {  
		  
		MtSupchrgBill mtSupchrgBill = null;  
		  try {  
			  mtSupchrgBill = vendorService.getMtSupchrgBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return mtSupchrgBill;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/mtsupchrgbill/add")
	public MtSupchrgBill addMtSupchrgBill(@RequestBody MtSupchrgBill mtSupchrgBill) {
		  try {  
		   return vendorService.addMtSupchrgBill(mtSupchrgBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/mtsupchrgbill/delete")
	public String deleteMtSupchrgBill(@RequestBody String MtSupchrgBillId) {
		  try {  
			  vendorService.deleteMtSupchrgBill(MtSupchrgBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/rpdetails")
	public @ResponseBody RpDetails getRpDetailsDetails(@FormParam("vendorId") String vendorId) {  
		  
		RpDetails rpDetails = null;  
		  try {  
			  rpDetails = vendorService.getRpDetailsDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return rpDetails;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/rpdetails/add")
	public RpDetails addRpDetails(@RequestBody RpDetails rpDetails) {
		  try {  
		   return vendorService.addRpDetails(rpDetails);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/rpdetails/delete")
	public String deleteRpDetails(@RequestBody String RpDetailsId) {
		  try {  
			  vendorService.deleteRpDetails(RpDetailsId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stbill")
	public @ResponseBody StBill getStBillDetails(@FormParam("vendorId") String vendorId) {  
		  
		StBill stBill = null;  
		  try {  
			  stBill = vendorService.getStBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stBill;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stbill/add")
	public StBill addStBill(@RequestBody StBill stBill) {
		  try {  
		   return vendorService.addStBill(stBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stbill/delete")
	public String deleteStBill(@RequestBody String StBillId) {
		  try {  
			  vendorService.deleteStBill(StBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stdistributor")
	public @ResponseBody StDistributor getStDistributorDetails(@FormParam("vendorId") String vendorId) {  
		  
		StDistributor stDistributor = null;  
		  try {  
			  stDistributor = vendorService.getStDistributorDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stDistributor;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stdistributor/add")
	public StDistributor addStDistributor(@RequestBody StDistributor stDistributor) {
		  try {  
		   return vendorService.addStDistributor(stDistributor);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stdistributor/delete")
	public String deleteStDistributor(@RequestBody String StDistributorId) {
		  try {  
			  vendorService.deleteStDistributor(StDistributorId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stdropdown")
	public @ResponseBody StDropdown getStDropdownDetails(@FormParam("vendorId") String vendorId) {  
		  
		StDropdown stDropdown = null;  
		  try {  
			  stDropdown = vendorService.getStDropdownDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stDropdown;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stdropdown/add")
	public StDropdown addStDropdown(@RequestBody StDropdown stDropdown) {
		  try {  
		   return vendorService.addStDropdown(stDropdown);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stdropdown/delete")
	public String deleteStDropdown(@RequestBody String StDropdownId) {
		  try {  
			  vendorService.deleteStDropdown(StDropdownId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stformdetails")
	public @ResponseBody StFormdetails getStFormdetailsDetails(@FormParam("vendorId") String vendorId) {  
		  
		StFormdetails stFormdetails = null;  
		  try {  
			  stFormdetails = vendorService.getStFormdetailsDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stFormdetails;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stformdetails/add")
	public StFormdetails addStFormdetails(@RequestBody StFormdetails stFormdetails) {
		  try {  
		   return vendorService.addStFormdetails(stFormdetails);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stformdetails/delete")
	public String deleteStFormdetails(@RequestBody String StFormdetailsId) {
		  try {  
			  vendorService.deleteStFormdetails(StFormdetailsId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stmappings")
	public @ResponseBody StMappings getStMappingsDetails(@FormParam("vendorId") String vendorId) {  
		  
		StMappings stMappings = null;  
		  try {  
			  stMappings = vendorService.getStMappingsDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stMappings;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stmappings/add")
	public StMappings addStMappings(@RequestBody StMappings stMappings) {
		  try {  
		   return vendorService.addStMappings(stMappings);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stmappings/delete")
	public String deleteStMappings(@RequestBody String StMappingsId) {
		  try {  
			  vendorService.deleteStMappings(StMappingsId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stsidemenu")
	public @ResponseBody StSideMenu getStSideMenuDetails(@FormParam("vendorId") String vendorId) {  
		  
		StSideMenu stSideMenu = null;  
		  try {  
			  stSideMenu = vendorService.getStSideMenuDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stSideMenu;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stsidemenu/add")
	public StSideMenu addStSideMenu(@RequestBody StSideMenu stSideMenu) {
		  try {  
		   return vendorService.addStSideMenu(stSideMenu);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stsidemenu/delete")
	public String deleteStSideMenu(@RequestBody String StSideMenuId) {
		  try {  
			  vendorService.deleteStSideMenu(StSideMenuId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stsubmenu")
	public @ResponseBody StSubMenu getStSubMenuDetails(@FormParam("vendorId") String vendorId) {  
		  
		StSubMenu stSubMenu = null;  
		  try {  
			  stSubMenu = vendorService.getStSubMenuDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stSubMenu;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stsubmenu/add")
	public StSubMenu addStSubMenu(@RequestBody StSubMenu stSubMenu) {
		  try {  
		   return vendorService.addStSubMenu(stSubMenu);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stsubmenu/delete")
	public String deleteStSubMenu(@RequestBody String StSubMenuId) {
		  try {  
			  vendorService.deleteStSubMenu(StSubMenuId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stsysteminfo")
	public @ResponseBody StSystemInfo getStSystemInfoDetails(@FormParam("vendorId") String vendorId) {  
		  
		StSystemInfo stSystemInfo = null;  
		  try {  
			  stSystemInfo = vendorService.getStSystemInfoDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stSystemInfo;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stsysteminfo/add")
	public StSystemInfo addStSystemInfo(@RequestBody StSystemInfo stSystemInfo) {
		  try {  
		   return vendorService.addStSystemInfo(stSystemInfo);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stsysteminfo/delete")
	public String deleteStSystemInfo(@RequestBody String StSystemInfoId) {
		  try {  
			  vendorService.deleteStSystemInfo(StSystemInfoId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/sttopmenu")
	public @ResponseBody StTopMenu getStTopMenuDetails(@FormParam("vendorId") String vendorId) {  
		  
		StTopMenu stTopMenu = null;  
		  try {  
			  stTopMenu = vendorService.getStTopMenuDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stTopMenu;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/sttopmenu/add")
	public StTopMenu addStTopMenu(@RequestBody StTopMenu stTopMenu) {
		  try {  
		   return vendorService.addStTopMenu(stTopMenu);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/sttopmenu/delete")
	public String deleteStTopMenu(@RequestBody String StTopMenuId) {
		  try {  
			  vendorService.deleteStTopMenu(StTopMenuId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/stuser")
	public @ResponseBody StUser getStUserDetails(@FormParam("vendorId") String vendorId) {  
		  
		StUser stUser = null;  
		  try {  
			  stUser = vendorService.getStUserDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stUser;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/stuser/add")
	public StUser addStUser(@RequestBody StUser stUser) {
		  try {  
		   return vendorService.addStUser(stUser);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/stuser/delete")
	public String deleteStUser(@RequestBody String StUserId) {
		  try {  
			  vendorService.deleteStUser(StUserId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/agencydetails")
	public @ResponseBody StUserCenters getStUserCentersDetails(@FormParam("vendorId") String vendorId) {  
		  
		StUserCenters stUserCenters = null;  
		  try {  
			  stUserCenters = vendorService.getStUserCentersDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return stUserCenters;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/agency/add")
	public StUserCenters addStUserCenters(@RequestBody StUserCenters stUserCenters) {
		  try {  
		   return vendorService.addStUserCenters(stUserCenters);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/agency/delete")
	public String deleteStUserCenters(@RequestBody String StUserCentersId) {
		  try {  
			  vendorService.deleteStUserCenters(StUserCentersId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/systemparams")
	public @ResponseBody SystemParams getSystemParamsDetails(@FormParam("vendorId") String vendorId) {  
		  
		SystemParams systemParams = null;  
		  try {  
			  systemParams = vendorService.getSystemParamsDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return systemParams;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/systemparams/add")
	public SystemParams addSystemParams(@RequestBody SystemParams systemParams) {
		  try {  
		   return vendorService.addSystemParams(systemParams);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/systemparams/delete")
	public String deleteSystemParams(@RequestBody String SystemParamsId) {
		  try {  
			  vendorService.deleteSystemParams(SystemParamsId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/trbill")
	public @ResponseBody TrBill getTrBillDetails(@FormParam("vendorId") String vendorId) {  
		  
		TrBill trBill = null;  
		  try {  
			  trBill = vendorService.getTrBillDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return trBill;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/trbill/add")
	public TrBill addTrBill(@RequestBody TrBill trBill) {
		  try {  
		   return vendorService.addTrBill(trBill);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/trbill/delete")
	public String deleteTrBill(@RequestBody String TrBillId) {
		  try {  
			  vendorService.deleteTrBill(TrBillId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/trbilldetail")
	public @ResponseBody TrBillDetail getTrBillDetailDetails(@FormParam("vendorId") String vendorId) {  
		  
		TrBillDetail trBillDetail = null;  
		  try {  
			  trBillDetail = vendorService.getTrBillDetailDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return trBillDetail;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/trbilldetail/add")
	public TrBillDetail addTrBillDetail(@RequestBody TrBillDetail trBillDetail) {
		  try {  
		   return vendorService.addTrBillDetail(trBillDetail);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/trbilldetail/delete")
	public String deleteTrBillDetail(@RequestBody String TrBillDetailId) {
		  try {  
			  vendorService.deleteTrBillDetail(TrBillDetailId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/trdailyunsold")
	public @ResponseBody TrDailyUnsold getTrDailyUnsoldDetails(@FormParam("vendorId") String vendorId) {  
		  
		TrDailyUnsold trDailyUnsold = null;  
		  try {  
			  trDailyUnsold = vendorService.getTrDailyUnsoldDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return trDailyUnsold;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/trdailyunsold/add")
	public TrDailyUnsold addTrDailyUnsold(@RequestBody TrDailyUnsold trDailyUnsold) {
		  try {  
		   return vendorService.addTrDailyUnsold(trDailyUnsold);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/trdailyunsold/delete")
	public String deleteTrDailyUnsold(@RequestBody String TrDailyUnsoldId) {
		  try {  
			  vendorService.deleteTrDailyUnsold(TrDailyUnsoldId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/trpaycashdetails")
	public @ResponseBody TrPaycashDetails getTrPaycashDetailsDetails(@FormParam("vendorId") String vendorId) {  
		  
		TrPaycashDetails trPaycashDetails = null;  
		  try {  
			  trPaycashDetails = vendorService.getTrPaycashDetailsDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return trPaycashDetails;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/trpaycashdetails/add")
	public TrPaycashDetails addTrPaycashDetails(@RequestBody TrPaycashDetails trPaycashDetails) {
		  try {  
		   return vendorService.addTrPaycashDetails(trPaycashDetails);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/trpaycashdetails/delete")
	public String deleteTrPaycashDetails(@RequestBody String TrPaycashDetailsId) {
		  try {  
			  vendorService.deleteTrPaycashDetails(TrPaycashDetailsId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/trpaycoup")
	public @ResponseBody TrPayCoup getTrPayCoupDetails(@FormParam("vendorId") String vendorId) {  
		  
		TrPayCoup trPayCoup = null;  
		  try {  
			  trPayCoup = vendorService.getTrPayCoupDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return trPayCoup;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/trpaycoup/add")
	public TrPayCoup addTrPayCoup(@RequestBody TrPayCoup trPayCoup) {
		  try {  
		   return vendorService.addTrPayCoup(trPayCoup);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/trpaycoup/delete")
	public String deleteTrPayCoup(@RequestBody String TrPayCoupId) {
		  try {  
			  vendorService.deleteTrPayCoup(TrPayCoupId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.GET,value = "/trpaydetails")
	public @ResponseBody TrPayDetails getTrPayDetailsDetails(@FormParam("vendorId") String vendorId) {  
		  
		TrPayDetails trPayDetails = null;  
		  try {  
			  trPayDetails = vendorService.getTrPayDetailsDetails(vendorId);  
		  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  }  
		  return trPayDetails;  
	 }
	
	@RequestMapping(method = RequestMethod.POST,value = "/trpaydetails/add")
	public TrPayDetails addTrPayDetails(@RequestBody TrPayDetails trPayDetails) {
		  try {  
		   return vendorService.addTrPayDetails(trPayDetails);  
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
	
	@RequestMapping(method = RequestMethod.DELETE,value = "/trpaydetails/delete")
	public String deleteTrPayDetails(@RequestBody String TrPayDetailsId) {
		  try {  
			  vendorService.deleteTrPayDetails(TrPayDetailsId);
		   return Constants.SUCCESS;   
		  } catch (Exception e) {  
		   e.printStackTrace();  
		  } 
		  return null;
	 }
}
