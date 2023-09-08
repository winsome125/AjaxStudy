package good;

import common.JDBConnect;

public class GoodDAO extends JDBConnect {

	// 게시물 1개 얻어오기
	public GoodDTO selectView(String idx) {
		
		GoodDTO dto = new GoodDTO();
		
		// 쿼리문 작성
		String sql = "select * from good where idx=?";
		try {
			// prepared객체생성, 인파라미터 설정, 쿼리실행
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setGcnt(rs.getInt(2));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int updateGoodCount(String idx) {
		
		int result = 0;
		
		String sql = "update good set gcnt=gcnt+1 where idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
