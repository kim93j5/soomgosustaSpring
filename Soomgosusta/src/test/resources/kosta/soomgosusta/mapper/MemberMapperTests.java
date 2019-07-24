import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.mapper.MemberMapper;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

		@Setter(onMethod_=@Autowired)
		private MemberMapper mapper;
		
		@Test
		public void testRegister(){
			
			MemberVO memberVO = new MemberVO();
			memberVO.setMember_Id("kim");
			memberVO.setM_Password("kim1234");
			memberVO.setM_Name("kim");
			
			log.info(MemberVO);
			mapper.register(memberVO);
			log.info(meberVO);
		}
}
