package com.jl3b.touche_nubes.admin.mapper;

import com.jl3b.touche_nubes.membervo.AdminVo;

public interface AdminSQLMapper {
	
	public AdminVo selectAdminNo(int admin_no);
	
	public AdminVo selectAdminByIdAndPw(AdminVo adminVo); // 관리자 로그인
	
}
