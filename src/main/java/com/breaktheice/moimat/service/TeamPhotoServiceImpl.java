package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;
import com.breaktheice.moimat.persistence.TeamPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class TeamPhotoServiceImpl implements TeamPhotoService {

    @Autowired
    TeamPostMapper mapper;

    @Override
    public TeamPostDomain getPost(Long postId, Long brdId) {
        return mapper.selectPost(postId,brdId);
    }

    @Override
    public List<TeamPostDomain> getAllPosts(Long groupId, Long brdId) {
        return mapper.selectAllPosts(groupId, brdId);
    }

    public List<TeamPostDomain> getThumbnail(List<TeamPostDomain> list) {

        // 썸네일 추출해서 썸네일 등록
        String content = "";
        String src = "";

//		String src = (content);
//		domain.setSrc(src);

        for(TeamPostDomain domain : list){
            content = domain.getPostContent() == null? "":domain.getPostContent();

            //패턴작업
            Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
            Matcher matcher = pattern.matcher(content);

            while(matcher.find()){
                if(matcher.group(1) != null) {
                    src= matcher.group(1);
                    domain.setImgPath(src);;
                    break;
                }
            }
        }
        return list;
    }

}
