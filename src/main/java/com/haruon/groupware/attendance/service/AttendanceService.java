package com.haruon.groupware.attendance.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.attendance.dto.RequestAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseAttendanceList;
import com.haruon.groupware.attendance.dto.ResponseBusinessTripList;
import com.haruon.groupware.attendance.dto.ResponseLeaveList;
import com.haruon.groupware.attendance.entity.Attendance;
import com.haruon.groupware.attendance.mapper.AttendanceMapper;
import com.haruon.groupware.user.entity.EmpEntity;
import com.haruon.groupware.user.mapper.EmpMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AttendanceService {
	@Autowired private AttendanceMapper attendanceMapper;
	@Autowired private EmpMapper empMapper;

	// 시간을 형식을 Long으로 파싱하는 메서드 
	private Long parsingDate(String paramDate) {
		// 시간 비교 및 연산을 위한 DateTime 포맷팅 형식
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		
		try {
			return dateFormat1.parse(paramDate).getTime();
		} catch(ParseException e1) {
			try {
				return dateFormat2.parse(paramDate).getTime();
			} catch(Exception e2) {
				try {
                    return dateFormat3.parse(paramDate).getTime();
                } catch(ParseException e3) {
                	log.debug("DateFormat으로 지정하지 않는 형식, Parsing 오류(AttendanceService - parsingDate 오류)");
                    e3.printStackTrace();
                    return null;
                }
			}
		}
	}
	
	// 두 시간 간격 계산
	private Integer calculateHours(String startTime, String endTime) {
		Long end = 0L;
		Long start = 0L;
		end = parsingDate(endTime);
		start = parsingDate(startTime);
		
		return (int) ( (end - start) / 1000 / 60 / 60);
	}
	
    // 연차 및 출장 리스트 조회조건(To)에 사용 : 조회를 원하는 달의 말일 계산
    private String calculateMonthEnd(String beginDate) throws ParseException {
    	LocalDate date = LocalDate.parse(beginDate.trim());
    	String end = LocalDate.of(date.getYear()
    			, date.getMonth()
    			, LocalDate.of(date.getYear(), date.getMonth(), 1).lengthOfMonth())
    			.toString();
    	
    	return end;
    }
    
    // 근태리스트 조회조건(To)에 사용 : 조회를 원하는 달의 말일 계산 + 어제날짜와 비교
    private String getMonthEndOrYesterday(String beginDate) throws ParseException {
    	String yesterDay = LocalDate.now(ZoneId.of("Asia/Seoul"))
					                .minusDays(1)
					                .toString();
        String end = calculateMonthEnd(beginDate);
        
		return calculateHours(end, yesterDay) > 0 ? end : yesterDay;
    }
    
	// 근태리스트(월별) - deptNo : 부서원 전부
    public List<ResponseAttendanceList> findDeptAttendanceListByMonth(Integer deptNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = getMonthEndOrYesterday(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findDeptAttendanceListByMonth - 예외 발생");
			e.printStackTrace();
		}
		
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setDeptNo(deptNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		
    	return attendanceMapper.findAttendanceListByMonth(requestAttendanceList);
    }
    
    // 근태리스트(월별) - empNo : 개인
    public List<ResponseAttendanceList> findEmpAttendanceListByMonth(Integer empNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = getMonthEndOrYesterday(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findEmpAttendanceListByMonth - 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findEmpAttendanceListByMonth - 서비스 단" + requestAttendanceList.toString());
    	return attendanceMapper.findAttendanceListByMonth(requestAttendanceList);
    }
    
	// 휴가 신청 리스트(월별) - deptNo : 부서원 전부
    public List<ResponseLeaveList> findtDeptLeaveReqListByMonth(Integer deptNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findtDeptLeaveReqListByMonth - 파싱 예외 발생");
			e.printStackTrace();
		}
		
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setDeptNo(deptNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		
    	return attendanceMapper.findtLeaveReqListByMonth(requestAttendanceList);
    }
    
    // 휴가 신청 리스트(월별) - empNo : 개인
    public List<ResponseLeaveList> findtEmpLeaveReqListByMonth(Integer empNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findtEmpLeaveReqListByMonth - 날짜 파싱 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findEmpAttendanceListByMonth - 서비스 단" + requestAttendanceList.toString());
    	return attendanceMapper.findtLeaveReqListByMonth(requestAttendanceList);
    }
    
    // 평균 유급휴가 사용률(연간) - x : 회사 평균 / empNo : 개인 평균 / deptNo : 부서 평균
    public Double findLeaveUsageRateForYear(RequestAttendanceList requestAttendanceList) {
    	return attendanceMapper.findLeaveUsageRateForYear(requestAttendanceList);
    }
    
	// 연차 요약 및 사용률 리스트(연간) - empNo : 개인 / deptNo : 부서원
    public List<ResponseLeaveList> findLeaveUsageRateList(RequestAttendanceList requestAttendanceList) {
    	return attendanceMapper.findLeaveSumAndUsageRateList(requestAttendanceList);
    }
    
	// 출장 신청 리스트(월별) - deptNo : 부서원 전부
    public List<ResponseBusinessTripList> findDeptBusinessTripReqListByMonth(Integer deptNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findDeptBusinessTripReqListByMonth - 파싱 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setDeptNo(deptNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findDeptBusinessTripReqListByMonth - 서비스 단" + requestAttendanceList.toString());
		
    	return attendanceMapper.findBusinessTripListByMonth(requestAttendanceList);
    }
    
    // 출장 신청 리스트(월별) - empNo : 개인
    public List<ResponseBusinessTripList> findEmpBusinessTripReqListByMonth(Integer empNo, String yearMonth) {
    	String begin = yearMonth + "-01";
        String end = null;
        try {
			end = calculateMonthEnd(begin);
			log.debug("calculateEndDayOfMonth 결과 = " + end);
		} catch (ParseException e) {
			log.debug("findDeptBusinessTripReqListByMonth - 날짜 파싱 예외 발생");
			e.printStackTrace();
		}
        
		RequestAttendanceList requestAttendanceList = new RequestAttendanceList();
		requestAttendanceList.setEmpNo(empNo);
		requestAttendanceList.setFrom(begin + " 00:00:00");
		requestAttendanceList.setTo(end + " 23:59:59");
		log.debug("findEmpBusinessTripReqListByMonth - 서비스 단" + requestAttendanceList.toString());
    	return attendanceMapper.findBusinessTripListByMonth(requestAttendanceList);
    }
	
	// 메인페이지 오늘의 출/퇴근 시간 조회
	public Attendance findAttendanceByEmp(Integer empNo) {
		return attendanceMapper.findAttendanceByEmp(empNo);
	}

	// 메인페이지 오늘 출/퇴근 시간 등록
	public String registerAttendance(Integer empNo) {
		// 현재 로그인한 사람
		
		// 현재시간 
		String nowTime = LocalDateTime
					.now(ZoneId.of("Asia/Seoul"))
					.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		
		// 오늘 attendance 중 startTime이 있는지 확인
		
		
		// 근태기록 update / insert parameter
		Attendance attForRegister = new Attendance();
		attForRegister.setEmpNo(empNo);
		
		if(attendanceMapper.findAttendanceByEmp(empNo) != null) {
			attForRegister.setStartTime(LocalDate.now(ZoneId.of("Asia/Seoul")).toString());
			attForRegister.setEndTime(nowTime);
			attendanceMapper.updateAttendance(attForRegister);
			return "퇴근시간등록-정상등록";
		} else {	// 오늘자 근태내용없으면
			// (0) 연차, 출장 기록 가져오기 - todaySchedules
			String today = LocalDate.now(ZoneId.of("Asia/Seoul")).toString();
			Attendance attForSearch = new Attendance();
			attForSearch.setEmpNo(Integer.parseInt(String.valueOf(empNo)));
			attForSearch.setStartTime(today);
			List<Map<String, Object>> todaySchedules = attendanceMapper.findDaySchByEmpAndDay(attForSearch);
			
			String businessTripStart = null;  // 출장 시작 시간
			
			// (1) 오늘이 [연차]라면 등록 막고, [출장]이 있다면 현재시간과 비교하여 더 이른시간으로 등록하게끔하기
			for(Map<String, Object> sch : todaySchedules) {
	        	if(sch.get("schType").equals("연차")) {
	        		return "연차-미등록";
	        	}
	        	if(sch.get("schType").equals("출장")) {
	        		if(businessTripStart != null) {
	        			log.debug("오늘 출장 기록이 2번 이상 있음");
	        			Long startInVar = parsingDate(businessTripStart);
	        			Long startInMap = parsingDate(sch.get("startTime").toString());
	        			
		        		businessTripStart = (startInVar > startInMap)? sch.get("startTime").toString() : businessTripStart;
	        		} else {
	        			businessTripStart = sch.get("startTime").toString();
	        		}
	        	}
			}
			
			String startTimeForRegister;
			
			if(businessTripStart != null) {
				if(calculateHours(nowTime, businessTripStart) < 0) {
					startTimeForRegister = businessTripStart;
					attForRegister.setStartTime(startTimeForRegister);
					attendanceMapper.createAttendance(attForRegister);
					return "시작시간등록-출장시간";
				}
			} 
			
			startTimeForRegister = nowTime;
			attForRegister.setStartTime(startTimeForRegister);
			attendanceMapper.createAttendance(attForRegister);
			return "시작시작등록-정상등록";
		}
	}
	
	// 근태 승인여부 변경 approvalYN modify - 1
	public boolean modifyAttendancies(List<String> modifyTargets) {
		
		try {
			Attendance att = null;
			int predictedExecuteCnt = modifyTargets.size();
			int actualExecuteCnt = 0;
			
			for(String target : modifyTargets) {
				String[] targetArr = target.split(" ");
				att = new Attendance();
				att.setEmpNo(Integer.parseInt(targetArr[0]));
				att.setStartTime(targetArr[1]);
				att.setApprovalYN("Y");
				log.debug(att.toString());
				
				
				attendanceMapper.updateAttendance(att);
				actualExecuteCnt++;
			}
			
			if(predictedExecuteCnt == actualExecuteCnt) {
				return true;
			} 
			throw new RuntimeException("AttendanceService - modifyAttendancies 에러 : 선택한 갯수와 update된 쿼리 실행 결과가 달라, 초기화");
		} catch(RuntimeException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	// 전날 전 직원 attendance 데이터 업데이트
	@Scheduled(cron = "00 00 00 * * *")
	public void schedulePreviousDayAttState() {
		String yesterday = (LocalDate.now(ZoneId.of("Asia/Seoul")).minusDays(1)).toString();
		
		// 1) 퇴사일자가 null인 모든 직원 리스트 가져오기 - 스케쥴링 대상
		List<EmpEntity> empList = empMapper.findAllEmp();
		
		Attendance yesterDayAtt = null;
		Attendance newAtt = null;	// 갱신된 attendance 인스턴스
		List<Map<String, Object>> findVacationAtt = new ArrayList<>(); // 어제의 사원의 연차/출장 기록
		
		// 2) (전날 + 특정 직원)으로 attendance테이블에 행이 있는지 판단 - 있으면 해당행을 update 하고, 없으면 해당행을 insert 하고
		loopOut :
		for(EmpEntity emp : empList) {
			log.debug("'" + emp.getEmpNo() + "'번 사원의 근태스케쥴링 결과");
			yesterDayAtt = new Attendance(); // 특정 직원의 어제자 근태 데이터 행
			newAtt = new Attendance();	// 갱신된 attendance 인스턴스
			
	        Integer halfDayOffTime = 0;		  // 반가 시간
	        String businessTripStart = null;  // 출장 시작 시간
	        String businessTripEnd = null;	  // 출장 마친 시간
			
			yesterDayAtt.setEmpNo(emp.getEmpNo());
			yesterDayAtt.setStartTime(yesterday);
			findVacationAtt = attendanceMapper.findDaySchByEmpAndDay(yesterDayAtt);	// 어제자 연차/출장 기록
			
			yesterDayAtt = attendanceMapper.findAttendance(yesterDayAtt);	// 어제자 근태 기록
	        
	        newAtt.setEmpNo(emp.getEmpNo());

	        for(Map<String, Object> sch : findVacationAtt) {
	        	log.debug(emp.getEmpNo() + "의 스케쥴 객체 = " + sch.toString());
	        	
	        	// 어제가 연차라면 행등록하고 다음 직원 근태 스케쥴링으로 넘어간다.
	        	if(sch.get("schType").equals("연차")) {
	        		log.debug("어제 연차기록이 있어 연차 등록함.");
	        		newAtt.setStartTime(yesterday + " 00:00:00");
	        		newAtt.setEndTime(yesterday + " 23:59:59");
	        		newAtt.setState("연차");
	        		attendanceMapper.createAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 연차 등록 insert");
	        		continue loopOut;
	        	} 
	        	
	        	// 어제가 반차라면 근태시간 체크시 반차 시간 산입 및 반차에 대한 행 추가
	        	if(sch.get("schType").equals("반차")) {
	        		log.debug("어제 반차기록이 있어 반차기록을 추가함");
	        		halfDayOffTime = calculateHours(sch.get("startTime").toString(), sch.get("endTime").toString());
	        		newAtt.setStartTime(sch.get("startTime").toString());
	        		newAtt.setEndTime(sch.get("endTime").toString());
	        		newAtt.setState("반차");
	        		attendanceMapper.createAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 반차 등록 insert");
	        	}
	        	
	        	// 어제 중 출장을 다녀왔으면 출장기록을 변수에 담는데, 출장이 여러번이라면 start는 더 이른시간으로 end는 더 늦은 시간을 기록한다.
	        	if(sch.get("schType").equals("출장")) {
	        		log.debug("어제 출장 기록 있음");
	        		if(businessTripStart != null || businessTripEnd != null) {
	        			log.debug("어제 출장 기록이 2번 이상 있음");
	        			Long startInVar = parsingDate(businessTripStart);
	        			Long endInVar = parsingDate(businessTripEnd); 
	        			Long startInMap = parsingDate(sch.get("startTime").toString());
	        			Long endInMap = parsingDate(sch.get("endTime").toString()); 
	        			
		        		businessTripStart = (startInVar > startInMap)? sch.get("startTime").toString() : businessTripStart;
		        		businessTripEnd = (endInVar > endInMap)? businessTripEnd : sch.get("endTime").toString();
	        		} else {
	        			businessTripStart = sch.get("startTime").toString();
	        			businessTripEnd = sch.get("endTime").toString();
	        		}
	        	}
        	}
	        
			// 근무시간(workHour) 확인
			int workHour = 0; // 출장시간을 고려한 출퇴근 기간 
			Integer attHour = workHour + halfDayOffTime;	// 근태상태 판단기준 시간 = 출퇴근(출장시간 고려) + 반가시간
			
			if(yesterDayAtt != null) { // 출근버튼이라도 찍었을 경우
				log.debug("이미 대상 attendance 행이 있음");
				newAtt.setStartTime(yesterday);
				
		        if(yesterDayAtt.getEndTime() != null) {
		        	// 어제자 근태기록에 출, 퇴근 시간 찍혀있을 경우
		        	workHour = calculateHours(yesterDayAtt.getStartTime(), yesterDayAtt.getEndTime());
		        	log.debug("출퇴근 기록있음");
		        } else if (businessTripEnd != null) {
		        	// 어제자 근태기록에 퇴근 시간은 없지만, 출장 기록이 있는 경우
		        	workHour = calculateHours(yesterDayAtt.getStartTime(), businessTripEnd);
		        	yesterDayAtt.setEndTime(businessTripEnd);
		        	log.debug("출근기록있음 + 어제자 퇴근기록 없음, 출장종료시간으로 퇴근시간 대체");
		        } else {
		        	// 어제자 근태기록에 퇴근 시간과 출장 기록 둘 다 없는 경우 : 결근으로 처리 후 다음 멤버 근태 관리 스케쥴링
	        		newAtt.setEndTime(yesterday + " 23:59:59");
		        	newAtt.setState("결근");
		        	
	        		attendanceMapper.updateAttendance(newAtt);
	        		log.debug("empNo = " + emp.getEmpNo() + "출근기록있음 + 어제자 퇴근/출장 기록 없음 - 결근 등록 update");
	        		continue;
		        }
		        
		        attHour = workHour + halfDayOffTime;	
		        
		        // 근무시간 별 근태 기록 업데이트 + 생성
		        if(attHour < 5) {
		        	// 결근으로 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("결근");
		        } else if (attHour < 9) {
		        	// 조퇴 및 지각으로 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("조퇴및지각");
		        } else {
		        	// 정상근무 등록
	        		newAtt.setEndTime(yesterDayAtt.getEndTime());
	        		newAtt.setState("정상근무");
		        }
	        	log.debug("newAtt 객체 = " + newAtt.toString());
		        attendanceMapper.updateAttendance(newAtt);
		        log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 인스턴스가 이미 있는 경우, 근태시각 파악 및 update");
		        
			} else {	// 출근버튼도 누르지 않았을 경우
				log.debug("attendance 행 없음");
				log.debug("businessTripStart = " + businessTripStart + "businessTripEnd" + businessTripEnd);
				
				
				if(businessTripStart != null && businessTripEnd != null) {	// 출장기록이 있는 경우
					workHour = calculateHours(businessTripStart, businessTripEnd);										
					attHour = workHour + halfDayOffTime;
					newAtt.setStartTime(businessTripStart);
	        		newAtt.setEndTime(businessTripEnd);
	        		
	        		log.debug("인스턴스 없음, 출장시간과 종료 시간으로 근무시간 기록");
	        		
					if(attHour < 5) {
			        	// 결근으로 등록
		        		newAtt.setState("결근");
			        } else if (attHour < 9) {
			        	// 조퇴 및 지각으로 등록
		        		newAtt.setState("조퇴및지각");
			        } else {
			        	// 정상근무 등록
		        		newAtt.setState("정상근무");
			        }
				} else {
					newAtt.setStartTime(yesterday + " 23:59:59");
	        		newAtt.setEndTime(yesterday + " 23:59:59");
		        	newAtt.setState("결근");
				}
				log.debug("전날 인스턴스가 없는 경우, insert 객체 = " + newAtt.toString());
				attendanceMapper.createAttendance(newAtt);
				log.debug("empNo = " + emp.getEmpNo() + "schedulePreviousDayAttState - 인스턴스가 없는 경우, 근태시각 파악 및 insert");
			}
		}
	}
}






