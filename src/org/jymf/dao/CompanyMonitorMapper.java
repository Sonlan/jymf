package org.jymf.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.jymf.entity.CompanyMonitor;

public interface CompanyMonitorMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(CompanyMonitor record);

    int insertSelective(CompanyMonitor record);

    CompanyMonitor selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(CompanyMonitor record);

	List<CompanyMonitor> query(Map<Object, Object> map);
	/**
	 * 查询下一级监管单位
	 * @param map
	 * @return
	 */
	List<CompanyMonitor> regionquery(Map<Object, Object> map);
	/**
	 * 查询下属监管公司列表
	 * @param monitorId
	 * @return
	 */
	List<BigDecimal> companyIdquery(BigDecimal monitorId);
	
	/**
	 * 查出最大的ID信息
	 * @return
	 */
	int findMaxId();
	List<BigDecimal> findIdByAreaCode(String areaCode);
	/**
	 * 根据用户名查找信息
	 * @param account
	 * @return
	 */
    CompanyMonitor selectByCompanyMonitor(String account);
    
    /**
	 * 查询用户，通过用户名/密码
	 * @param map
	 * @return
	 */
    CompanyMonitor selectByAccountAndPassword(Map<String, Object> map);
    
    /**
     * 修改当前用户的密码
     */
    
    int updateByPrimaryKey(CompanyMonitor record);
    /**
     * 同步数据库所用，取出所有的记录
     */
    List<CompanyMonitor> getAllObjects();
    void updateByNameLike(Map<String, Object> map);
}