package com.example.ruru_back_end.model.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "workspaces")
@Getter
@Setter
@NoArgsConstructor
public class Workspace {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer workspaceId;

    @Column(nullable = false)
    private String workspaceName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "leader_id", columnDefinition = "user_id")
    private User leader;

    @Column(nullable = false , columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @CreationTimestamp
    private OffsetDateTime createdAt;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @UpdateTimestamp
    private OffsetDateTime updatedAt;

    @OneToMany(mappedBy = "workspace", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<WorkspaceMember> workspaceMembers = new HashSet<>();

    @OneToMany(mappedBy = "workspace", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<WorkspaceInvitation> workspaceInvitations = new HashSet<>();

    @OneToMany(mappedBy = "workspace", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<InvitationLink> invitationLinks = new HashSet<>();
}
