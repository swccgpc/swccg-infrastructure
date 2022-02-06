github_repos = {
  "epicduel" = {
    repo = "swccgpc/epicduel"
    policies = {
      "ListAllMyBuckets" = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "VisualEditor0",
    "Effect": "Allow",
    "Action": ["s3:Get*", "s3:List*"],
    "Resource": ["arn:aws:s3:::epicduel.starwarsccg.org"]
  },{
    "Sid": "VisualEditor1",
    "Effect": "Allow",
    "Action": ["s3:ListAllMyBuckets"],
    "Resource": "*"
  }]
}
EOF

      "s3-epicduel-starwarsccg-org" = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "VisualEditor0",
    "Effect": "Allow",
    "Action": ["s3:Get*","s3:List*"],
    "Resource": [
      "arn:aws:s3:::epicduel.starwarsccg.org",
      "arn:aws:s3:::epicduel.starwarsccg.org/*"
    ]
  },{
    "Sid": "VisualEditor1",
    "Effect": "Allow",
    "Action": ["s3:Put*"],
    "Resource": ["arn:aws:s3:::epicduel.starwarsccg.org/*"]
  }]
}
EOF

      "cf-create-invalidation" = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "VisualEditor0",
    "Effect": "Allow",
    "Action": [
      "cloudfront:GetDistribution",
      "cloudfront:GetInvalidation",
      "cloudfront:CreateInvalidation"
    ],
    "Resource": "arn:aws:cloudfront::230787692442:distribution/E7I5ZFY1IJWEX"
  }]
}
EOF
    } ## policies
  } ## epicduel





  "DiscordCardLinker" = {
    repo = "swccgpc/DiscordCardLinker"
    policies = {
      "ecr-discordcardlinker" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ecr:PutImageTagMutability",
                "ecr:StartImageScan",
                "ecr:UploadLayerPart",
                "ecr:BatchDeleteImage",
                "ecr:ListImages",
                "ecr:PutImage",
                "ecr:UntagResource",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeImages",
                "ecr:TagResource",
                "ecr:DescribeRepositories",
                "ecr:StartLifecyclePolicyPreview",
                "ecr:InitiateLayerUpload",
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability"
            ],
            "Resource": [
                "arn:aws:ecr:us-east-2:230787692442:repository/discordcardlinker",
                "arn:aws:ecr:us-east-2:230787692442:discordcardlinker"
            ]
        },{
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ecr:DescribeRegistry",
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability"
            ],
            "Resource": "*"
        },{
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "ecs:UpdateService"
            ],
            "Resource": "arn:aws:ecs:us-east-2:230787692442:service/swccg/discordcardlinker"
        }]
}
EOF
    } ## policies
  } ## DiscordCardLinker


  "holotable"         = {
    repo = "swccgpc/holotable"
    policies = {
      "cf-create-invalidation" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:GetDistribution",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "arn:aws:cloudfront::230787692442:distribution/E4R02360UW5RJ"
        }
    ]
}
EOF
      "list-s3-buckets" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "*"
        }
    ]
}
EOF
      "s3-res-starwarsccg-org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:Put*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org/cards/*",
                "arn:aws:s3:::res.starwarsccg.org/packs/*"
            ]
        }
    ]
}
EOF
    } ## policies
  } ## holotable


  "holotable-website" = {
    repo = "swccgpc/holotable-website"
    policies = {
      "cf-invalidate" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:GetDistribution",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "arn:aws:cloudfront::230787692442:distribution/E2YAV8XKR86PXW"
        }
    ]
}
EOF
      "list-s3-bucket" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::holotable.starwarsccg.org",
                "arn:aws:s3:::holotable.starwarsccg.org"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "*"
        }
    ]
}
EOF
      "s3-holotable-website-starwarsccg-org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:Put*"
            ],
            "Resource": [
                "arn:aws:s3:::holotable.starwarsccg.org",
                "arn:aws:s3:::holotable.starwarsccg.org/*"
            ]
        }
    ]
}
EOF
    } ## policies
  } ## holotable-website


  "orgchart"          = {
    repo = "swccgpc/orgchart"
    policies = {
      "cf-create-invalidation" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:GetDistribution",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "arn:aws:cloudfront::230787692442:distribution/E4R02360UW5RJ"
        }
    ]
}
EOF
      "list-s3-buckets" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "*"
        }
    ]
}
EOF
      "s3-res-starwarsccg-org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:Put*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org/orgchart/*"
            ]
        }
    ]
}
EOF
    } ## policies
  } ## orgchart


  "swccg-card-json"   = {
    repo = "swccgpc/swccg-card-json"
    policies = {
      "cf-invalidation" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:GetDistribution",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "arn:aws:cloudfront::230787692442:distribution/E2CSZKAUVDC9IT"
        }
    ]
}
EOF
      "list-s3-buckets" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::scomp.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "*"
        }
    ]
}
EOF
      "s3-scomp.starwarsccg.org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:Put*",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::scomp.starwarsccg.org",
                "arn:aws:s3:::scomp.starwarsccg.org/*"
            ]
        }
    ]
}
EOF
    } ## policies
  } ## swccg-card-json


  "streaming" = {
    repo = "swccgpc/streaming"
    policies = {
      "cloudfront-streaming.starwarsccg.org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:ListInvalidations",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "arn:aws:cloudfront::230787692442:distribution/EF104WIQ7UEVG"
        }
    ]
}
EOF
      "s3-streaming.starwarsccg.org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:Put*"
            ],
            "Resource": [
                "arn:aws:s3:::streaming.starwarsccg.org",
                "arn:aws:s3:::streaming.starwarsccg.org/*"
            ]
        }
    ]
}
EOF

    } ## policies
  } ## swccg-playtesting

  "swccg-vkit"        = {
    repo = "swccgpc/swccg-vkit"
    policies = {
      "cf-invalidation" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "cloudfront:GetDistribution",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": [
                "arn:aws:cloudfront::230787692442:distribution/E28JJ75W3J9G61",
                "arn:aws:cloudfront::230787692442:distribution/E4R02360UW5RJ"
            ]
        }
    ]
}
EOF
      "list-s3-buckets" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::vkit.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": "*"
        }
    ]
}
EOF
      "s3-res-vkit" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org",
                "arn:aws:s3:::res.starwarsccg.org/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:Put*"
            ],
            "Resource": [
                "arn:aws:s3:::res.starwarsccg.org/vkit/*",
                "arn:aws:s3:::res.starwarsccg.org/vkit/cards*",
                "arn:aws:s3:::res.starwarsccg.org/vkit/cards/standard/*"
            ]
        }
    ]
}
EOF
      "s3-vkit.starwarsccg.org" = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:Put*",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::vkit.starwarsccg.org",
                "arn:aws:s3:::vkit.starwarsccg.org/*"
            ]
        }
    ]
}
EOF
    } ## policies
  } ## swccg-vkit


#  "swccg-playtesting" = {
#    repo = "swccgpc/swccg-playtesting"
#    policies = {
#
#    } ## policies
#  } ## swccg-playtesting
#
#
#  "swccg-scomp"       = {
#    repo = "swccgpc/swccg-scomp"
#    policies = {
#
#    } ## policies
#  } ## swccg-scomp
#
#  "swccg-vkit-images" = {
#    repo = "swccgpc/swccg-vkit-images"
#    policies = {
#
#    } ## policies
#  } ## swccg-vkit-images
#
#
#  "tournament"        = {
#    repo = "swccgpc/tournament"
#    policies = {
#
#    } ## policies
#  } ## tournament
#
#
#  "yj-scomp"          = {
#    repo = "swccgpc/yj-scomp"
#    policies = {
#
#    } ## policies
#  } ## yj-scomp
#
#
#  "youngjedi"         = {
#    repo = "swccgpc/youngjedi"
#    policies = {
#
#    } ## policies
#  } ## youngjedi




} ## github_repos
