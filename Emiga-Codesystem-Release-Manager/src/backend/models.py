from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.types import JSON
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from .db import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(100), unique=True, index=True, nullable=False)
    password_hash = Column(String(255), nullable=False)
    role = Column(String(50), nullable=False, default="editor")
    created_at = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    edits = relationship("UserEdit", back_populates="user")
    resources = relationship("CodeSystemResource", back_populates="owner")


class CodeSystemResource(Base):
    __tablename__ = "resources"

    id = Column(String(100), primary_key=True, index=True)
    url = Column(String(255), nullable=False)
    name = Column(String(255), nullable=False)
    status = Column(String(50), nullable=False)
    version = Column(String(50), nullable=False)
    concepts = Column(JSON, nullable=False, default=list)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    created_at = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)
    updated_at = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now(), nullable=False)

    owner = relationship("User", back_populates="resources")


class UserEdit(Base):
    __tablename__ = "user_edits"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    resource_id = Column(String(100), ForeignKey("resources.id"), nullable=False)
    action = Column(String(100), nullable=False)
    payload = Column(JSON, nullable=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now(), nullable=False)

    user = relationship("User", back_populates="edits")