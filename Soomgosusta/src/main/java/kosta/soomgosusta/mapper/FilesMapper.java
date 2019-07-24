package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.E_FilesVO;

public interface FilesMapper {
	
	public void insert(E_FilesVO vo);
	public void delete(String e_Uuid);
	public List<E_FilesVO> findLicense(String e_Id);
	public List<E_FilesVO> findPortfolio(String e_Id);
}
