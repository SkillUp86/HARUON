package com.haruon.groupware.draft.rest;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.haruon.groupware.draft.dto.response.ResponseDraft;
import com.haruon.groupware.draft.service.DraftService;

@RestController
public class DocumentRestController {

	private final DraftService draftService;
	
	public DocumentRestController(DraftService draftService) {
		this.draftService = draftService;
	}
	// 기안한 문서
	@GetMapping("/drafts/{empNo}")
	public ResponseEntity<List<ResponseDraft>> draftList(@PathVariable int empNo) {
		List<ResponseDraft> draftByPage = draftService.getDraftByPage(empNo);
		return ResponseEntity.ok(draftByPage);
	}
	// 결재할 문서
	@GetMapping("/approvals/{empNo}")
	public ResponseEntity<List<ResponseDraft>> approvalList(@PathVariable int empNo) {
		List<ResponseDraft> draftByApproval = draftService.getDraftByApproval(empNo);
		return ResponseEntity.ok(draftByApproval);
	}
}
