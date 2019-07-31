package kosta.soomgosusta.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import kosta.soomgosusta.domain.E_FilesVO;
import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.ExpertInfoVO;
public interface ExpertService {

	public void register(ExpertVO expertVO) throws UnsupportedEncodingException;

	public int login(LoginDTO loginDTO) throws UnsupportedEncodingException;

	public ExpertVO findExpert(String login_Id);

	public E_ProfileVO getProfile(String e_Id);

	public int updateEPhoto(Map<String, String> param);

	public int updateProfile(E_ProfileVO vo);
	
	public void insertExpertInfo(ExpertInfoVO expert_Info, int p_Seq);

	public void uploadFile(E_FilesVO vo);
	
	public void licenseDelete(String ef_Uuid);
	
	public List<E_FilesVO> getFileList(String e_Id);
	
	
}
