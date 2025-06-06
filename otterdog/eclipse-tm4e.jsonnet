// see https://github.com/EclipseFdn/otterdog-defaults/blob/main/otterdog-defaults.libsonnet
local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

// see https://otterdog.readthedocs.io/en/latest/reference/organization/
orgs.newOrg('technology.tm4e', 'eclipse-tm4e') {
  settings+: {
    description: "",
    name: "Eclipse TM4E",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/tm4e/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push",
      ],
    },
  ],
  _repositories+:: [
    // see https://otterdog.readthedocs.io/en/latest/reference/organization/repository/#repository
    orgs.newRepo('tm4e') {
      allow_merge_commit: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "TextMate support in Eclipse IDE",
      has_discussions: true,
      has_projects: false,
      has_wiki: true,
      homepage: "https://projects.eclipse.org/projects/technology.tm4e",
      squash_merge_commit_message: "PR_BODY",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "eclipse",
        "eclipse-plugin",
        "hacktoberfest",
        "java",
        "textmate"
      ],
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}