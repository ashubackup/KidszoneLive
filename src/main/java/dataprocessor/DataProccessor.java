package dataprocessor;

import java.sql.ResultSet;
import java.util.*;

import datacollector.DataCollector;

public class DataProccessor {
	
	
	public static List<String> getCategories()
	{
		
		return DataCollector.getMainCategorys();
		
		
	}
	
	public static ResultSet getContent(String catname)
	{
		if(catname.equalsIgnoreCase("games"))
		{
			return DataCollector.getGamesByCatname(catname);
		}
		return DataCollector.getVideosByCatname(catname);
		
	}
	
	public static Map<String ,String > getVideo(String id)
	{
		
		return DataCollector.getVideoById(id);
		
	}
	
	public static ResultSet getBanners()
	{
		return DataCollector.getBannersUrl();
	}

}
