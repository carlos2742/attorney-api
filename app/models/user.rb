class User < ApplicationRecord
  enum rol: [ :guest, :collaborator, :admin ]
end
