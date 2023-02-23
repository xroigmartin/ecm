package xroigmartin.ecm.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xroigmartin.ecm.domain.model.DomainMemberText;
import xroigmartin.ecm.domain.model.DomainMemberTextId;

public interface DomainMemberTextRepository extends JpaRepository<DomainMemberText, DomainMemberTextId> {
}
