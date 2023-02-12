package xroigmartin.ecm.domain.model;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name ="domain_member_text")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode
public class DomainMemberText implements Serializable {

    @Serial
    private static final long serialVersionUID = -5388141010904828665L;
    @EmbeddedId
    private DomainMemberTextId id;

    @Column(name = "member_text", nullable = false)
    private String text;

    @Column(name = "create_on", nullable = false, updatable = false)
    private LocalDateTime createOn = LocalDateTime.now();

    @Column(name = "modify_on", nullable = false)
    private LocalDateTime modify_on = LocalDateTime.now();
}
