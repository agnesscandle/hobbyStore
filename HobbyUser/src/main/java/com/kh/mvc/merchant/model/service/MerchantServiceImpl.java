package com.kh.mvc.merchant.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.merchant.model.mapper.MerchantMapper;
import com.kh.mvc.merchant.model.vo.Merchant;


@Service
public class MerchantServiceImpl implements MerchantService{
	@Autowired
	private MerchantMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Merchant login(String merId, String merPassword) {
		
		
		Merchant merchantmember = this.findById(merId);
		
		// 암호화된 비밀번호와 맞는지 확인
		// System.out.println(passwordEncoder.matches(merPassword, merchantmember.getMerPassword()));
		
		return merchantmember != null && 
				passwordEncoder.matches(merPassword, merchantmember.getMerPassword()) ? merchantmember : null;
	}

	@Override
	@Transactional 
	public int save(Merchant merchantMember) {
		int result = 0;
		
		if(merchantMember.getMerNo() != 0) {
			// update
//			result = mapper.updateMember(member);
		} else {
			merchantMember.setMerPassword(passwordEncoder.encode(merchantMember.getMerPassword()));
			
			result = mapper.insertMerchantMember(merchantMember);
		}
		
		return result;
	}
	
	@Override
	public Merchant findById(String merId) {
		Merchant a = mapper.selectMerchantMember(merId);
       System.out.println(a);

		return mapper.selectMerchantMember(merId);
	}
	
	

	@Override
	public boolean validate(String merid) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	
	
	@Override
	public int getHobbyCount() {
		return mapper.selectHobbyCount();
	}

	
	@Override
	public List<Hobby> getHobbyList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectHobbyList(rowBounds);
	}
	

	@Override
	@Transactional
	public int save(Hobby hobby) {
		int result = 0;

		if (hobby.getHbNo() != 0) {
			// 업데이트
		} else {
			result = mapper.insertHobby(hobby);
		}
		return result;
	}

	@Override
	public List<Category> getCateList() {
		// TODO Auto-generated method stub
		return mapper.selectCateList();
	}

	@Override
	public void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby) {
		String originalFileString = null;
		String renamedFileString = null;
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String fileName = System.currentTimeMillis() + originFileName;

			String safeFile = savePath + fileName;

			try {
				mf.transferTo(new File(safeFile));

				if (renamedFileString == null) {
					originalFileString = originFileName;
					renamedFileString = fileName;
				} else {
					originalFileString = originalFileString + "," + originFileName;
					renamedFileString = renamedFileString + "," + fileName;
				}

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		hobby.setHbImgsOri(originalFileString);
		hobby.setHbImgsRename(renamedFileString);
	}

	@Override
	public void saveFile(MultipartFile thumFile, String savePath, Hobby hobby) {

		String thumOri = null;
		String thumRename = null;

		/* 썸네일 이미지 저장 */
		thumOri = thumFile.getOriginalFilename();
		thumRename = System.currentTimeMillis() + thumOri;

		try {
			String safeFile = savePath + thumRename;
			thumFile.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		hobby.setHbThumOri(thumOri);
		hobby.setHbThumRename(thumRename);

	}

	@Override
	public List<Hobby> getHobbyList(PageInfo pageInfo, int adNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectHobbyMerList(rowBounds,adNo);
	}

	@Override
	public List<Hobby> getHobbycalList(PageInfo pageInfo, int merNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectHobbyCalList(rowBounds,merNo);
	}

	@Override
	public int calculateApply(Reserve reserve) {
		return mapper.insertCalApply(reserve);
		
	}



	@Override
	public int getReserveCount(int hbNo) {
		return mapper.selectReserveCount(hbNo);
	}

	@Override
	public List<Reserve> getReserveList(int hbNo) {

		return mapper.selectReserveList(hbNo);
	}

	@Override
	public int reserveUpdateStatus(Reserve reserve) {
		
		return mapper.reserveUpdateStatus(reserve);
	}

	@Override
	public int getHobbyCountByMerNo(int merNo) {
		
		return mapper.selectHobbyCountByMerNo(merNo);
	}

	@Override
	public List<Hobby> getHobbyListByMerNo(PageInfo pageInfo, int merNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.getHobbyListByMerNo(rowBounds, merNo);
	}

	@Override
	public int getReserveCountByHbNo(int hbNo) {
		
		return mapper.selectReserveCountByHbNo(hbNo);
	}

	@Override
	public List<Reserve> getReserveListByHbNo(PageInfo pageInfo, int hbNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.getReserveListByHbNo(rowBounds, hbNo);
	}


	@Override
	public String selectResStatusByNo(int hbNo, int resNo) {
		
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("hbNo", hbNo);
		hashMap.put("resNo", resNo);
		
		return mapper.selectResStatusByNo(hashMap);
	}

	@Override
	public int resCancle(int hbNo, int resNo) {
		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("hbNo", hbNo);
		hashMap.put("resNo", resNo);
		
		return mapper.resCancle(hashMap);
	}

	
}
