package kosta.soomgosusta.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.service.PartService;
import kosta.soomgosusta.service.RequestService;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/part/*")
public class MainRestController {

	@Autowired
	private PartService service;
	
	@Autowired
	private RequestService rservice;

	@GetMapping(value = "/listPart/{data}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<PartVO>> getPart(@PathVariable("data") String data) {

		log.info(data);
		return new ResponseEntity<>(service.detailPartService(data), HttpStatus.OK);
	}

	@GetMapping(value = "/listPopular", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<String>> getPopular() {
		List<String> list = service.listPopularService();
		log.info(list);
		return new ResponseEntity<>(service.listPopularService(), HttpStatus.OK);
	}
	
	@GetMapping(value= "/listRecommend/{id}/{divide}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<PartVO>> getRecommend(@PathVariable("id") String id, @PathVariable("divide") String divide) throws Exception{
		log.info(id);
		log.info(divide);
		
		if(divide.equals("member")){

			List<RequestVO> rlist = rservice.listAllRequestService();//전체 요청
			List<RequestVO> list = rservice.listRequestService(id);//내 요청			
			List<PartVO> plist = service.listPartService();
			
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\data\\member_rcm.csv"));		
			
			for(int i=0; i< plist.size(); i++){
				for(int j=0; j<plist.size(); j++){
					if(i != j){
						if(plist.get(i).getP_L_Word().equals(plist.get(j).getP_L_Word())){
							if(plist.get(i).getP_M_Word().equals(plist.get(j).getP_M_Word())){
								//대,중 다 같을 때
								bw.write(plist.get(i).getP_Seq()+","+plist.get(j).getP_Seq()+","+5+"\n");
							}else{
								//대만 같을 때
								bw.write(plist.get(i).getP_Seq()+","+plist.get(j).getP_Seq()+","+3+"\n");
							}
						}else{
							bw.write(plist.get(i).getP_Seq()+","+plist.get(j).getP_Seq()+","+1+"\n");
						}
					}
				}
			}

			bw.close();
			List<Integer> recommendItems = recommend_service(list.get(0).getP_Seq());
			
			for(int i=0; i< recommendItems.size(); i++){
				log.info(recommendItems.get(i));
			}
		}
		
		return null;
	}
	
	public List<Integer> recommend_service(int m_no) throws Exception{
		//데이터 모델
		DataModel dm = new FileDataModel(new File("C:\\data\\member_rcm.csv"));
		
		//유사도		
		//UserSimilarity sim = new PearsonCorrelationSimilarity(dm);
		TanimotoCoefficientSimilarity sim = new TanimotoCoefficientSimilarity(dm);
				
		UserNeighborhood neighborhood = new NearestNUserNeighborhood(2, sim, dm);

		//User Based Recommender
		GenericUserBasedRecommender recommender = new GenericUserBasedRecommender(dm, neighborhood, sim);
		
		long num = m_no;
		log.info(num);
		List<RecommendedItem> recommendations = recommender.recommend(num, 4);
		
		List<Integer> list = new ArrayList<>();
		
		for(RecommendedItem items: recommendations){
			log.info(items.getItemID() + "    " + items.getValue());
			list.add((int)items.getItemID());
		}
		log.info(list);
		return list;
	}
}
