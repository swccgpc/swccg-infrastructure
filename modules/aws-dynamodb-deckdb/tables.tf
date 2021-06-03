




##
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table
##

##
## Users { username: string }
##
resource "aws_dynamodb_table" "Users" {
  name           = "Users"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "username"

  attribute {
    name = "username"
    type = "S"
  }

  tags = {
    Name        = "Users"
    Environment = "production"
  }
} ## Users

##
## DeckComments { deckId: string, created_at: string }
##
resource "aws_dynamodb_table" "DeckComments" {
  name           = "DeckComments"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "deckId"
  range_key      = "created_at"

  attribute {
    name = "deckId"
    type = "S"
  }
  attribute {
    name = "created_at"
    type = "S"
  }

  tags = {
    Name        = "DeckComments"
    Environment = "production"
  }
} ## DeckComments


##
## CardComments { cardId: number, created_at: string }
##
resource "aws_dynamodb_table" "CardComments" {
  name           = "CardComments"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "cardId"
  range_key      = "created_at"

  attribute {
    name = "cardId"
    type = "N"
  }
  attribute {
    name = "created_at"
    type = "S"
  }

  tags = {
    Name        = "CardComments"
    Environment = "production"
  }
} ## CardComments


##
## DeckRatings { deckId: string, authorId: number }
##
resource "aws_dynamodb_table" "DeckRatings" {
  name           = "DeckRatings"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "deckId"
  range_key      = "authorId"

  attribute {
    name = "deckId"
    type = "S"
  }
  attribute {
    name = "authorId"
    type = "N"
  }

  tags = {
    Name        = "DeckRatings"
    Environment = "production"
  }
} ## DeckRatings

##
## Decks { id: string } 
##
## GSI: { deleted-updated_at-index:  { deleted: number,  updated_at: string }, 
##        authorId-updated_at-index: { authorId: number, updated_at: string } }
##
resource "aws_dynamodb_table" "Decks" {
  name           = "Decks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "deleted"
    type = "N"
  }

  attribute {
    name = "updated_at"
    type = "S"
  }

  attribute {
    name = "authorId"
    type = "N"
  }

  global_secondary_index {
    name               = "deleted-updated_at-index"
    hash_key           = "deleted"    # must be defined as an attribute in the resource.
    range_key          = "updated_at" # must be defined
    ##
    ## Represents attributes that are copied (projected) from the table into an index.
    ## These are in addition to the primary key attributes and index key attributes,
    ## which are automatically projected.
    ##
    projection_type    = "ALL"        # ALL, INCLUDE or KEYS_ONLY
                                      # ALL......: All of the table attributes are projected into the index.
                                      # KEYS_ONLY: In addition to the attributes described in KEYS_ONLY,
                                      #            the secondary index will include other non-key attributes 
                                      #            that you specify.
                                      # INCLUDE..: projects only the keys specified 
                                      #            in the non_key_attributes parameter.
  } ## GSI deleted-updated_at-index

  global_secondary_index {
    name               = "authorId-updated_at-index"
    hash_key           = "authorId"   # must be defined as an attribute in the resource.
    range_key          = "updated_at" # must be defined
    ##
    ## Represents attributes that are copied (projected) from the table into an index.
    ## These are in addition to the primary key attributes and index key attributes,
    ## which are automatically projected.
    ##
    projection_type    = "ALL"        # ALL, INCLUDE or KEYS_ONLY
                                      # ALL......: All of the table attributes are projected into the index.
                                      # KEYS_ONLY: In addition to the attributes described in KEYS_ONLY,
                                      #            the secondary index will include other non-key attributes 
                                      #            that you specify.
                                      # INCLUDE..: projects only the keys specified 
                                      #            in the non_key_attributes parameter.
  } ## GSI authorId-updated_at-index


  tags = {
    Name        = "Decks"
    Environment = "production"
  }
} ## Decks




