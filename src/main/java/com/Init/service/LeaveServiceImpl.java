package com.Init.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Init.domain.LeaveVO;
import com.Init.persistence.LeaveDAO;

@Service
public class LeaveServiceImpl implements LeaveService {

	private static final Logger logger = LoggerFactory.getLogger(LeaveServiceImpl.class);

	@Inject
	private LeaveDAO leaveDAO;

	@Autowired
	private LeaveService leaveService;

	public List<LeaveVO> getAllLeaves(String emp_id) {
		return leaveDAO.getAllLeaves(emp_id);
	}

	@Override
	public LeaveVO getLeaveById(int leave_id) {
		return leaveDAO.selectLeaveById(leave_id);
	}

	@Override
	public void updateLeave(int leave_id, LeaveVO leaveData) {
		leaveDAO.updateLeave(leave_id, leaveData);
	}

	@Override
	public void deleteLeave(int leave_id) {
		leaveDAO.deleteLeave(leave_id);
	}

	@Override
	public List<LeaveVO> getLeaveInfo(String emp_id) {
		logger.debug("emp_id를 반환되는지 : " + emp_id);
		return leaveDAO.selectLeaveInfo(emp_id);

	}

	@Override
	public void useAnnualLeave(LeaveVO leaveVO) {
		
		    // 4. 데이터베이스에 연차 신청 요청 저장
		    leaveDAO.insertLeaveRequest(leaveVO); // 연차 사용 요청 저장

	}

	// 휴가 신청서
	@Override
	public void submitLeaveRequest(LeaveVO leaveVO) {
		leaveDAO.insertLeaveRequestA(leaveVO); // DAO 메서드 호출
	}

	@Override
	public List<LeaveVO> getLeaveStatus(String emp_id) {
		// Mapper를 통해 데이터베이스에서 정보를 조회
		return leaveDAO.findLeaveByEmpId(emp_id);
	}
}