from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from passlib.context import CryptContext

DATABASE_URL = "sqlite:///./src/backend/ecum.db"

engine = create_engine(
    DATABASE_URL,
    connect_args={"check_same_thread": False},
    future=True,
)

SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False, future=True)
Base = declarative_base()

# Use pbkdf2_sha256 so bcrypt backend issues don't block startup
pwd_context = CryptContext(schemes=["pbkdf2_sha256"], deprecated="auto")


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def get_password_hash(password: str) -> str:
    return pwd_context.hash(password[:72])


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password[:72], hashed_password)


def init_db():
    from .models import User, CodeSystemResource

    Base.metadata.create_all(bind=engine)

    with SessionLocal() as db:
        if not db.query(User).filter(User.username == "admin").first():
            db.add(
                User(
                    username="admin",
                    password_hash=get_password_hash("password123"),
                    role="admin",
                )
            )

        if not db.query(User).filter(User.username == "editor").first():
            db.add(
                User(
                    username="editor",
                    password_hash=get_password_hash("editor1"),
                    role="editor",
                )
            )

        if not db.query(CodeSystemResource).filter(CodeSystemResource.id == "cs-001").first():
            db.add(
                CodeSystemResource(
                    id="cs-001",
                    url="http://example.com/codesystems/cs-001",
                    name="ExampleCodeSystem",
                    status="active",
                    version="1.0.0",
                    concepts=[
                        {"code": "active", "display": "Active", "definition": "The resource is active"},
                        {"code": "inactive", "display": "Inactive", "definition": "The resource is inactive"},
                    ],
                )
            )

        db.commit()