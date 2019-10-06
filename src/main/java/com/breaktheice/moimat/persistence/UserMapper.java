package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.MemberDomain;

public interface UserMapper {

	MemberDomain selectMember(String memEmail);
}
