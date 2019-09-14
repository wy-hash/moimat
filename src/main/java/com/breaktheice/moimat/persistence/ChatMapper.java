package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.ChatDomain;

public interface ChatMapper {
	
	List<ChatDomain> list();
}
