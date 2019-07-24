package kosta.soomgosusta.service;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	

	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;

	
	@Override
	public void register(MemberVO memberVO) throws UnsupportedEncodingException {
		
		String target =memberVO.getM_Password();
		byte[] targetBytes = target.getBytes("utf-8");
		
		Encoder encoder = Base64.getEncoder();
		
		byte[] encodeBytes = encoder.encode(targetBytes);
		System.out.println(new String(encodeBytes));
		
		String password = encoder.encodeToString(targetBytes);
		System.out.println(password);
		
		memberVO.setM_Password(password);
		log.info(memberVO.getM_Password());
		mapper.register(memberVO);
		
		log.info(memberVO);
		
	}


	@Override
	public int login(LoginDTO loginDTO) throws UnsupportedEncodingException {
		
		String login_Id=loginDTO.getId();
		MemberVO memberVO = mapper.findMember(login_Id);
		
		Decoder decoder = Base64.getDecoder();
		
		byte[] decodeBytes = decoder.decode(memberVO.getM_Password());
		String password = new String(decodeBytes, "UTF-8");
		
		System.out.println("=========login_service pass ========"+password);
		if(loginDTO.getId().equals(memberVO.getM_Id())&&
				loginDTO.getPassword().equals(password)){
				loginDTO.setSuccess(0);
			return loginDTO.getSuccess();
		}else if(loginDTO.equals(memberVO.getM_Id())){
			loginDTO.setSuccess(1);
			return loginDTO.getSuccess();
		}else{
			loginDTO.setSuccess(2);
			return loginDTO.getSuccess();
		}
		
		
		
		
	}


	@Override
	public MemberVO findMember(String login_Id) {
		
		MemberVO memberVO = mapper.findMember(login_Id);
		return memberVO;
	}
	
	
}
