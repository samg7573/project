package egovframework.sample.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import egovframework.sample.service.FeedbackVO;
import egovframework.sample.service.UserVO;


public class FeedbackRowMapper implements RowMapper<FeedbackVO>{

	@Override
	public FeedbackVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		FeedbackVO feedback=new FeedbackVO();
		feedback.setId(rs.getString("id"));
		feedback.setTtl(rs.getString("ttl"));
		feedback.setBbs_cn(rs.getString("bbs_cn"));
		feedback.setReg_dt(rs.getDate("reg_dt"));
		feedback.setMdfcn_dt(rs.getDate("mdfcn_dt"));
		feedback.setRcmdtn_cnt(rs.getInt("rcmdtn_cnt"));
		feedback.setPhoto(rs.getString("photo"));

		feedback.setReg_user(rs.getString("reg_user"));
		feedback.setMdfcn_user(rs.getString("mdfcn_user"));

	    
	    return feedback;
	}

}
