package xroigmartin.ecm.domain.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xroigmartin.ecm.domain.repository.DomainRepository;
import xroigmartin.ecm.domain.service.DomainMemberService;

@Service
public class DomainMemberServiceImpl implements DomainMemberService {

    @Autowired
    private DomainRepository domainRepository;
}
