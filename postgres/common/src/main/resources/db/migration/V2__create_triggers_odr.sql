-- =====================================================
-- Function auto update column "updated"
-- =====================================================
CREATE OR REPLACE FUNCTION odr.set_updated_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- Trigger for  odr.tags
-- =====================================================
CREATE TRIGGER trg_tags_updated
BEFORE UPDATE ON odr.tags
FOR EACH ROW
EXECUTE FUNCTION odr.set_updated_timestamp();

-- =====================================================
-- Trigger for  odr.orders
-- =====================================================
CREATE TRIGGER trg_orders_updated
BEFORE UPDATE ON odr.orders
FOR EACH ROW
EXECUTE FUNCTION odr.set_updated_timestamp();

-- =====================================================
-- Trigger for  odr.payments
-- =====================================================
CREATE TRIGGER trg_payments_updated
BEFORE UPDATE ON odr.payments
FOR EACH ROW
EXECUTE FUNCTION odr.set_updated_timestamp();
