-- =====================================================
-- Function auto update column "updated"
-- =====================================================
CREATE OR REPLACE FUNCTION idp.set_updated_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- Trigger for  idp.credentials
-- =====================================================
CREATE TRIGGER trg_credentials_updated
BEFORE UPDATE ON idp.credentials
FOR EACH ROW
EXECUTE FUNCTION idp.set_updated_timestamp();

-- =====================================================
-- Trigger for  idp.scopes
-- =====================================================
CREATE TRIGGER trg_scopes_updated
BEFORE UPDATE ON idp.scopes
FOR EACH ROW
EXECUTE FUNCTION idp.set_updated_timestamp();

-- =====================================================
-- Trigger for  idp.audiences
-- =====================================================
CREATE TRIGGER trg_audiences_updated
BEFORE UPDATE ON idp.audiences
FOR EACH ROW
EXECUTE FUNCTION idp.set_updated_timestamp();
