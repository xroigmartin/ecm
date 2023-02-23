package xroigmartin.ecm.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xroigmartin.ecm.domain.model.DomainMember;

public interface DomainMemberRepository extends JpaRepository<DomainMember, Long> {
}
