package xroigmartin.ecm.domain.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DomainMemberTextId implements Serializable {

    @Serial
    private static final long serialVersionUID = 4031074939696730881L;
    @Column(name="id_domain_member", nullable = false)
    private Long idDomainMember;

    @Column(name="idiom", nullable = false, length = 2)
    private String idiom;
}
