package egovframework.sample.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class weekCalendar {

	public static HashMap<String, String> getCurrentWeekOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1; // calendar에서의 월은 0부터 시작
		int day = calendar.get(Calendar.DATE);

		// 한 주의 시작은 월요일이고, 첫 주에 4일이 포함되어있어야 첫 주 취급 (목/금/토/일)
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.setMinimalDaysInFirstWeek(4);

		int weekOfMonth = calendar.get(Calendar.WEEK_OF_MONTH);

		// 첫 주에 해당하지 않는 주의 경우 전 달 마지막 주차로 계산
		if (weekOfMonth == 0) {
			calendar.add(Calendar.DATE, -day); // 전 달의 마지막 날 기준
			return getCurrentWeekOfMonth(calendar.getTime());
		}

		// 마지막 주차의 경우
		if (weekOfMonth == calendar.getActualMaximum(Calendar.WEEK_OF_MONTH)) {
			calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE)); // 이번 달의 마지막 날
			int lastDaysDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); // 이번 달 마지막 날의 요일

			// 마지막 날이 월~수 사이이면 다음달 1주차로 계산
			if (lastDaysDayOfWeek >= Calendar.MONDAY && lastDaysDayOfWeek <= Calendar.WEDNESDAY) {
				calendar.add(Calendar.DATE, 1); // 마지막 날 + 1일 => 다음달 1일
				return getCurrentWeekOfMonth(calendar.getTime());
			}
		}
		HashMap<String, String> calall = new HashMap<String, String>();

		calall.put("year", Integer.toString(year));
		calall.put("month", Integer.toString(month));
		calall.put("day", Integer.toString(day));
		calall.put("weekOfMonth", Integer.toString(weekOfMonth));

		return calall;
	}

	public static String[] getDaysOfWeek(String dateStr) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String[] arrYMD = new String[7];
		try {
			Date date = df.parse(dateStr);
			Calendar cal = Calendar.getInstance();
			// 한 주의 시작은 월요일이고, 첫 주에 4일이 포함되어있어야 첫 주 취급 (목/금/토/일)
			cal.setFirstDayOfWeek(Calendar.MONDAY);
			cal.setMinimalDaysInFirstWeek(4);

			cal.setTime(date);
			
			int inYear = cal.get(cal.YEAR); 
		    int inMonth = cal.get(cal.MONTH);
		    int inDay = cal.get(cal.DAY_OF_MONTH);
		    
		    int yoil = cal.get(cal.DAY_OF_WEEK); //요일나오게하기(숫자로)
		    if(yoil != 1){   //해당요일이 일요일이 아닌경우
		        yoil = yoil-2;
		     }else{           //해당요일이 일요일인경우
		        yoil = 7;
		     }
		    inDay = inDay-yoil;
		    
		    for(int i = 0; i < 7;i++){
		     cal.set(inYear, inMonth, inDay+i);  //
		     String y = Integer.toString(cal.get(cal.YEAR)); 
		     String m = Integer.toString(cal.get(cal.MONTH)+1);
		     String d = Integer.toString(cal.get(cal.DAY_OF_MONTH));
		     if(m.length() == 1) m = "0" + m;
		     if(d.length() == 1) d = "0" + d;
		     
		     arrYMD[i] =y+"-"+ m +"-"+d;
		    }
		} catch (ParseException e) {
		}
		
		return arrYMD;
	}
	
	
	
	
	/*
	 * // 월을 입력하면 주차 계산. public HashMap<String, String>
	 * getCurrentWeekOfMonth_day(String Year, String Month) throws ParseException {
	 * Calendar calendar = Calendar.getInstance(Locale.KOREA);
	 * calendar.setFirstDayOfWeek(Calendar.MONDAY);
	 * calendar.setMinimalDaysInFirstWeek(4);
	 * 
	 * String YMD = Year + "-" + Month; DateFormat df = new
	 * SimpleDateFormat("yyyy-MM-dd"); Date date = df.parse(YMD+"-01") ;
	 * calendar.setTime(date);
	 * 
	 * HashMap<String, Hash>
	 * 
	 * 
	 * 
	 * return null;
	 * 
	 * }
	 */}
