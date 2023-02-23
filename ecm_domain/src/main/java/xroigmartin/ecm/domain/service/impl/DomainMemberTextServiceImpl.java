package xroigmartin.ecm.domain.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xroigmartin.ecm.domain.repository.DomainMemberRepository;
import xroigmartin.ecm.domain.service.DomainMemberTextService;

@Service
public class DomainMemberTextServiceImpl implements DomainMemberTextService {

    @Autowired
    private DomainMemberRepository domainMemberRepository;
}
