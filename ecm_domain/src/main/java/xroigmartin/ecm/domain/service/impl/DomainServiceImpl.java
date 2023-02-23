package xroigmartin.ecm.domain.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xroigmartin.ecm.domain.repository.DomainMemberTextRepository;
import xroigmartin.ecm.domain.service.DomainService;

@Service
public class DomainServiceImpl implements DomainService {

    @Autowired
    private DomainMemberTextRepository domainMemberTextRepository;
}
