package com.kryptos.npp.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class DailyJobs extends TimerTask {

	private final static long ONCE_PER_DAY = 1000 * 60 * 60 * 24;

	// private final static int ONE_DAY = 1;
	private final static int TWO_AM = 1;

	@Override
	public void run() {
		
	}

	public static void main(String arg[]) {
		startTask();
	}

	private static Date getTomorrowMorning2AM() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, TWO_AM);
		cal.set(Calendar.MINUTE, 10);
		cal.set(Calendar.SECOND, 0);
		cal.add(Calendar.DATE, 1);
		Date date = cal.getTime();
		return date;
	}

	public static void startTask() {
		DailyJobs task = new DailyJobs();
		Timer timer = new Timer();
		timer.schedule(task, getTomorrowMorning2AM(), ONCE_PER_DAY);
	}
	

}
