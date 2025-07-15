## PR 및 파일 구조 가이드라인
<details>
  <summary>PR 가이드라인 (필독!) - <a href="https://www.notion.so/route-five/Pull-Request-Guideline-2303696e576d80f9902cfc745aa78dec?source=copy_link">Notion의 PR Guideline</a> 참고</summary>
  
  - 커밋 가이드라인에 맞춰서 커밋을 해주시되, 한 PR에서 할당된 내용이 여러개이거나, 과정이 있을 경우 커밋을 **여러 개로 나누어 작성** 하시길 권장드립니다.
  - 만약 컴포넌트를 새로 만들거나, 디자인 관련 PR일 경우 스크린샷 혹은 작동 화면녹화를 `PR 설명` 에 적어주세요.  
  - Coderabbit (AI)이 PR을 생성할 경우 리뷰합니다. 봇 코멘트는 참고만 하시고, `Resolve Conversation` 누르시면 됩니다.  
  - 각 프로젝트의 Lead 및 Sub-Lead (FE의 경우 @hoony6134, @rhseung) 검토자로 넣어주세요.  
  - 2개의 `approve` 가 있어야 `main` 으로 머지가 가능합니다. 만약 Lead 혹은 Sub-Lead의 승인을 받았다면 `@coderabbitai approve` 를 댓글에 작성하면 토끼가 승인을 눌러줘서 2개가 됩니다.  
</details>

<details>
  <summary>파일 구조 가이드라인 (필독!) - <a href="https://www.notion.so/route-five/File-Structure-Guideline-2313696e576d80d985bed3bc2214dbf9?source=copy_link">Notion의 File Structure Guideline</a> 참고</summary>
  
  - 본 프로젝트는 `MVVM` 구조를 따릅니다.
  - `lib/main.dart` 파일은 수정하지 말아 주세요.
  - 테스트 파일은 프로덕션 파일에 포함해서는 안됩니다.
  - 모든 파일 및 폴더는 `snake-case` 명명법을 따릅니다.
      - 옳은 예) `auth/register/step-4.dart` , `main.dart`
      - 나쁜 예) `Views/component.dart` , `step_4.dart`
  - 기능에 알맞는 폴더(view, service, model 등)에 파일을 추가해 주세요.
</details>

## 체크리스트
- [ ] 파일 구조가 알맞게 작성되었습니다.
- [ ] 커밋 가이드라인에 맞는 커밋 메시지를 작성하였습니다.
- [ ] 작동 화면을 포함하지 않는 PR이거나, 아래 스크린샷/화면녹화를 업로드했습니다.
