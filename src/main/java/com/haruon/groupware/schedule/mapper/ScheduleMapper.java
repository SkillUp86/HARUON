package com.haruon.groupware.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.schedule.entity.Schedules;



@Mapper
public interface ScheduleMapper {
	List<Schedules> schedulesList();
	
	int addSchedule (Schedules schedules);
	
	Integer deleteSchedule (Integer schNo);
	
	Integer updateSchedule (Schedules schedules);
	
	Schedules scheduleOne (Integer schNo);
	
}
