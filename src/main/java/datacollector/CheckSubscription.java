package datacollector;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import api.Loaderr;

public class CheckSubscription {

	public static int checkUser(String ani) {
		int status = 0;
		try {
			int count = 0;
			String query = "select count(ani) as cnt from tbl_subscription where ani='" + ani
					+ "' and service_type='kidsZone'";
			PreparedStatement ps = Loaderr.userconn.prepareStatement(query);
			System.out.println(query);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				count = rs.getInt(1);

			}
			if (count >= 1) {
					count = 0;
					query = "select count(1) as cnt from tbl_subscription where ani='" + ani
							+ "' and service_type='kidsZone' " + "and date(next_billed_date)>=  Date(subdate(now(),10))";
					PreparedStatement pst = Loaderr.userconn.prepareStatement(query);
					System.out.println(query);
					ResultSet rst = pst.executeQuery();
					if (rst.next()) {
						count = rst.getInt(1);
					}
						if (count >= 1) {
							status = 1;
						} else {
							status = 1; //update after testing
					}
			} else {
				status = 0;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

}
