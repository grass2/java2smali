package example;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.content.Context;

public class Example {
	
	
	 
    public static class BaseClass {
		private class Location {
			public double getAltitude(){return 0;}
			public float getBearing(){return 0;}
			public float getAccuracy(){return 0;}
			public double getLatitude(){return 0;}
			public double getLongitude(){return 0;}
			public float getSpeed(){return 0;}
			

		}
    
	    public float lastLat;
		public float lastLng;
		public float iBearing;
		public float iSpeed;
		public double iAltitude;
		public long lastGpsTime;
		public long lastMovementTime;
		public int ignition;
		public boolean needSendLocation;
		public long lastSentTime;
		private ArrayList<String> flagArrayList_AccSensor = new ArrayList<>();
		private Sensor accSensor;
		private Context service;
	
	    public boolean evalGps(float lat, float lng, double alt, float bearing, float speedy) {
	        float latDiff = Math.abs(this.lastLat - lat);
	        float lngDiff = Math.abs(this.lastLng - lng);
	        float timeDiff = (System.currentTimeMillis() - this.lastGpsTime) / 1000;
	        boolean updateLoc = (latDiff > 0.00004) || (lngDiff > 0.0005) || (this.iSpeed > 0.5);
	        if(updateLoc){
	            this.lastMovementTime = System.currentTimeMillis();
	            this.ignition = 1;
	        }else if(this.ignition == 1 && (System.currentTimeMillis() - this.lastMovementTime)>30 * 1000) {
	            this.ignition = 0;
	            updateLoc = true;
	        }else if((System.currentTimeMillis() -this.lastSentTime)>30 * 60 * 1000) {
	        	updateLoc = true;
	        }
	        if(updateLoc) {
	        	this.lastSentTime = System.currentTimeMillis();
	        }
	        return updateLoc;
	    }

		public void SetGps(float lat, float lng, double alt, float bearing, float speed, float accuracy) {
			this.needSendLocation = evalGps(lat, lng, alt, bearing, speed);
		}
	    
	    public void SetGps(float lat, float lng, double alt, float bearing, float speed) {
			this.SetGps(lat, lng, alt, bearing, speed, 0);
	    }
	
	    public void realSetGps(float lat, float lng, float bear, float speed, double alt, int ignition) {
	        String str = "lat:" + lat + ";lng:" + lng + ",head:" + bear + ";speed:" + Math.round(speed) + ";alt:" + Math.round(alt) + ";ign:" + ignition;
	        System.out.print( "realSetGps:" + str);
	       
	    }

		public void registerAccSensorListener(String flag) {
			if (!this.flagArrayList_AccSensor.contains(flag)) {
				this.flagArrayList_AccSensor.add(flag);
			}
			if (this.flagArrayList_AccSensor.size() == 1) {
				SensorManager sensorManager =(SensorManager) this.service.getSystemService(Context.SENSOR_SERVICE);
				this.accSensor = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
				registerSensorListener(this.accSensor, 3);
			}
		}

		private void registerSensorListener(Sensor sensor, int delay) {
		}

		public void onReceiveLocation(Location location) {
			if (location != null) {
				double Altitude = location.getAltitude();
				float Bearing = location.getBearing();
				float Accurancy = location.getAccuracy();
				double Latitude = location.getLatitude();
				double Longitude = location.getLongitude();
				this.SetGps((float) Latitude, (float) Longitude, Altitude, Bearing, location.getSpeed(), Accurancy);

			}
		}
	    
	    public void test() {
	    	this.realSetGps(this.lastLat, this.lastLng, this.iBearing, this.iSpeed, this.iAltitude,  this.ignition);
	    }
  }
}
